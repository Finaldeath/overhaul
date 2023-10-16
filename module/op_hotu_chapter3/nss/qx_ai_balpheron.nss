// Balpheron's custom AI

#include "nw_i0_generic"

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE);

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


int IsDifficult()
{
    return (GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES ||
           GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT);
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

    __TurnCombatRoundOn(TRUE);
    DoVoiceChat();

    // Immunity to silence:
    object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR);
    itemproperty ipSilence = ItemPropertySpellImmunitySpecific(IP_CONST_IMMUNITYSPELL_SILENCE);
    AddItemProperty(DURATION_TYPE_PERMANENT, ipSilence, oHide);

    /*
    - Instant cast all long-duration buffing (assume active before fight)
    - Cast time-stop
    - Cast all buffing spells
    - If wounded then cast vampiric touch
    - If don't have greater spell mantle then cast spell mantle
    - Revert to default AI
    */

   if(GetLocalInt(OBJECT_SELF, "DO_INSTANT_ONCE") == 0)
   {
       SetLocalInt(OBJECT_SELF, "DO_INSTANT_ONCE", 1);
       ActionCastSpellAtObject(SPELL_ENERGY_BUFFER, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_PREMONITION, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_FOXS_CUNNING, OBJECT_SELF, METAMAGIC_EXTEND, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_GLOBE_OF_INVULNERABILITY, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       if(IsDifficult())
           DelayCommand(5.0, ActionCastSpellAtObject(SPELL_IMPROVED_INVISIBILITY, OBJECT_SELF, METAMAGIC_EXTEND, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
   }
   if(GetHasSpell(SPELL_TIME_STOP))
   {
        MyCastSpell(SPELL_TIME_STOP, OBJECT_SELF);
        MyCastSpell(SPELL_MASS_HASTE, OBJECT_SELF);
        if(IsDifficult())
            MyCastSpell(SPELL_MESTILS_ACID_SHEATH, OBJECT_SELF, METAMAGIC_EXTEND);
        MyCastSpell(SPELL_GREATER_SPELL_MANTLE, OBJECT_SELF);
        MyCastSpell(SPELL_PROTECTION_FROM_SPELLS, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
            return;
   }
   if(!GetHasSpellEffect(SPELL_GREATER_SPELL_MANTLE))
   {
        if(GetHasSpell(SPELL_SPELL_MANTLE))
        {
            MyCastSpell(SPELL_SPELL_MANTLE, OBJECT_SELF);
            __TurnCombatRoundOn(FALSE);
                return;
        }
   }
   if(!GetHasSpellEffect(SPELL_MESTILS_ACID_SHEATH))
   {
        if(GetHasSpell(SPELL_DEATH_ARMOR))
        {
            MyCastSpell(SPELL_DEATH_ARMOR, OBJECT_SELF);
            __TurnCombatRoundOn(FALSE);
                return;
        }
   }
   float fHP = IntToFloat(GetCurrentHitPoints()) / IntToFloat(GetMaxHitPoints());

   if(fHP < 0.6)
   {
       if(GetHasSpell(SPELL_VAMPIRIC_TOUCH))
       {
            MyCastSpell(SPELL_VAMPIRIC_TOUCH, oIntruder);
            __TurnCombatRoundOn(FALSE);
                return;
       }
   }
   if(IsDifficult())
   {
        if(GetHasSpell(SPELL_BIGBYS_CLENCHED_FIST))
        {
            MyCastSpell(SPELL_BIGBYS_CLENCHED_FIST, oIntruder);
            __TurnCombatRoundOn(FALSE);
                return;
        }
        if(GetHasSpell(SPELL_SLOW))
        {
            MyCastSpell(SPELL_SLOW, oIntruder);
            __TurnCombatRoundOn(FALSE);
                return;
        }
        if(GetHasSpell(SPELL_HORRID_WILTING))
        {
            MyCastSpell(SPELL_HORRID_WILTING, oIntruder);
            __TurnCombatRoundOn(FALSE);
                return;
        }
        if(GetHasSpell(SPELL_FIREBRAND) && GetLocalInt(OBJECT_SELF, "DO_FIREBRAND_ONCE") == 0)
        {
            SetLocalInt(OBJECT_SELF, "DO_FIREBRAND_ONCE", 1);
            MyCastSpell(SPELL_FIREBRAND, oIntruder, METAMAGIC_EMPOWER);
            __TurnCombatRoundOn(FALSE);
                return;
        }
        if(GetHasSpell(SPELL_METEOR_SWARM))
        {
            MyCastSpell(SPELL_METEOR_SWARM, OBJECT_SELF);
            __TurnCombatRoundOn(FALSE);
                return;
        }
   }

   if(GetIsObjectValid(oIntruder))
    {

        if(TalentPersistentAbilities()) // * Will put up things like Auras quickly
        {
            __TurnCombatRoundOn(FALSE);
            return;
        }
        if (chooseTactics(oIntruder) == 99)
        {
            __TurnCombatRoundOn(FALSE);
            return;
        }

        object oNearEnemy = GetNearestSeenEnemy();
        DetermineCombatRound(oNearEnemy);
        __TurnCombatRoundOn(FALSE);
        return;
    }
     __TurnCombatRoundOn(FALSE);


}

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE)
{
    //SendMessageToPC(GetFirstPC(), "BOOM: Casting: " + GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpell))));
    ActionCastSpellAtObject(nSpell, oTarget, nMetaMagic, bCheat, nDomainLevel, nProjectilePathType, bInstantSpell);
}
