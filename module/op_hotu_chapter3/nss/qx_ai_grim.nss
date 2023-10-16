// Grimgnaw's custom AI

#include "nw_i0_generic"

int IsDifficult()
{
    return (GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES ||
           GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT);
}

void DoVoiceChat()
{
    int nRand = Random(20);
    int nVoice = -1;
    if(nRand == 0) nVoice = VOICE_CHAT_BATTLECRY1;
    else if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY2;
    else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY3;
    else if(nRand == 3) nVoice = VOICE_CHAT_TAUNT;
    else if(nRand == 4) nVoice = VOICE_CHAT_LAUGH;

    if(nVoice != -1)
        PlayVoiceChat(nVoice, OBJECT_SELF);
}

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF, "X2_NW_I0_GENERIC_INTRUDER");

    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();
    if (GetIsDead(oIntruder) == TRUE)
        return;

    if (__InCombatRound() == TRUE)
    {
        return;
    }
    DoVoiceChat();
    __TurnCombatRoundOn(TRUE);

    /*
    - First - use buffs
    - If wounded - then use Wholness of Body feat and then use talent heal on self (potions)
    - 20% of using knockdown
    - 20% of using flurry of blows
    - 20% of using Quivering palm
    - 20% of using stunning fist
    - 20% of normal attack
    */
   object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);
   itemproperty ipCritImmune = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_CRITICAL_HITS);
   AddItemProperty(DURATION_TYPE_PERMANENT, ipCritImmune, oArmor);

   if(GetLocalInt(OBJECT_SELF, "USED_BUFF") == 0 && IsDifficult())
   {
       SetLocalInt(OBJECT_SELF, "USED_BUFF", 1);
       effect eConceal = EffectConcealment(50);
       effect eVis = EffectVisualEffect(VFX_DUR_BLUR);
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eConceal, OBJECT_SELF, RoundsToSeconds(20));
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF, RoundsToSeconds(20));ActionCastSpellAtObject(SPELL_CATS_GRACE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_OWLS_WISDOM, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_DEATH_ARMOR, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
   }

   float fHP = IntToFloat(GetCurrentHitPoints()) / IntToFloat(GetMaxHitPoints());

   if(fHP < 0.5)
    {
        if(GetHasFeat(FEAT_WHOLENESS_OF_BODY))
        {
            //ActionUseFeat(FEAT_WHOLENESS_OF_BODY, OBJECT_SELF);
            ClearAllActions();
            ActionCastSpellAtObject(SPELLABILITY_WHOLENESS_OF_BODY, OBJECT_SELF, METAMAGIC_ANY,
                TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
            DecrementRemainingFeatUses(OBJECT_SELF, FEAT_WHOLENESS_OF_BODY);
            __TurnCombatRoundOn(FALSE);
            return;
        }
        if(TalentHealingSelf())
        {
             __TurnCombatRoundOn(FALSE);
            return;
        }
    }
    int nRand = Random(100) + 1;
    if(nRand <= 20 && IsDifficult()) // knockdown
    {
        ActionUseFeat(FEAT_KNOCKDOWN, oIntruder);
    }
    else if(nRand <= 40) // flurry of blow
    {
        ActionUseFeat(FEAT_FLURRY_OF_BLOWS, oIntruder);
    }
    else if(nRand <= 60) // quivering palm
    {
        ActionUseFeat(FEAT_QUIVERING_PALM, oIntruder);
    }
    else if(nRand <= 80 && IsDifficult()) // stunning attack
    {
        ActionUseFeat(FEAT_STUNNING_FIST, oIntruder);
    }
    else // normal attack
    {
        ActionAttack(oIntruder);
    }


    __TurnCombatRoundOn(FALSE);

}
