// Maugrim's custom AI

#include "nw_i0_generic"

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE);

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

    __TurnCombatRoundOn(TRUE);

    DoVoiceChat();
     // Immunity to silence:
    object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR);
    itemproperty ipSilence = ItemPropertySpellImmunitySpecific(IP_CONST_IMMUNITYSPELL_SILENCE);
    AddItemProperty(DURATION_TYPE_PERMANENT, ipSilence, oHide);

    // Create some healing scrolls, since he does not have healing spells...
    if(IsDifficult())
    {
        int j;
        for(j = 1; j <= 4; j++)
            CreateItemOnObject("x2_it_spdvscr402");
    }

    /*
    - Instant cast all long-duration buffing (assume active before fight)
    - First round - cast greater sanctuary
    - Try talent heal on self and allies
    - Cast all remaining buffs (assume sanctuary is still active)
    - Summon monster
    - Cast storm of vengeance on self
    - revert to default AI
    */

   if(GetLocalInt(OBJECT_SELF, "DO_INSTANT_ONCE") == 0)
   {
       SetLocalInt(OBJECT_SELF, "DO_INSTANT_ONCE", 1);
       ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_EAGLE_SPLEDOR, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_OWLS_WISDOM, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_ENDURANCE, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_PROTECTION_FROM_ELEMENTS, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_FREEDOM_OF_MOVEMENT, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_SPELL_RESISTANCE, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_TRUE_SEEING, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
   }
   float fHP = IntToFloat(GetCurrentHitPoints()) / IntToFloat(GetMaxHitPoints());
   if(fHP < 0.5)
   {
       if(TalentHeal())
       {
            __TurnCombatRoundOn(FALSE);
            return;
       }
   }

   if(GetHasSpell(SPELL_ETHEREALNESS))
   {
        MyCastSpell(SPELL_ETHEREALNESS, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
   }

   // try to heal friends
   int i = 1;
   object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, i);
   while(oCreature != OBJECT_INVALID)
   {
        if(GetMaster(oCreature) == OBJECT_INVALID) // not a summoned creature
        {
            fHP = IntToFloat(GetCurrentHitPoints(oCreature)) / IntToFloat(GetMaxHitPoints(oCreature));
            if(fHP < 0.5)
            {
                if(TalentHeal())
                {
                     __TurnCombatRoundOn(FALSE);
                     return;
                }
            }
        }
        i++;
        oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, i);
   }

   if(GetLocalInt(OBJECT_SELF, "DID_BUFF") == 0)
   {
        SetLocalInt(OBJECT_SELF, "DID_BUFF", 1);
        MyCastSpell(SPELL_UNHOLY_AURA, OBJECT_SELF, METAMAGIC_NONE, TRUE);
        MyCastSpell(SPELL_DIVINE_POWER, OBJECT_SELF);
        MyCastSpell(SPELL_DIVINE_FAVOR, OBJECT_SELF);
        MyCastSpell(SPELL_BATTLETIDE, OBJECT_SELF);
        MyCastSpell(SPELL_PRAYER, OBJECT_SELF);
        MyCastSpell(SPELL_BLESS, OBJECT_SELF);
        //MyCastSpell(SPELL_SUMMON_CREATURE_IX, oIntruder);
        //MyCastSpell(SPELL_STORM_OF_VENGEANCE, oIntruder);
        __TurnCombatRoundOn(FALSE);
        return;
   }

   if(IsDifficult())
   {
       if(GetHasSpell(SPELL_WORD_OF_FAITH))
       {
            MyCastSpell(SPELL_WORD_OF_FAITH, oIntruder);
            __TurnCombatRoundOn(FALSE);
            return;
       }
       if(GetHasSpell(SPELL_SUMMON_CREATURE_IX))
       {
            MyCastSpell(SPELL_SUMMON_CREATURE_IX, OBJECT_SELF);
            __TurnCombatRoundOn(FALSE);
            return;
       }
       if(GetHasSpell(SPELL_STORM_OF_VENGEANCE))
       {
            MyCastSpell(SPELL_STORM_OF_VENGEANCE, OBJECT_SELF);
             __TurnCombatRoundOn(FALSE);
            return;
       }
       if(GetHasSpell(SPELL_CIRCLE_OF_DOOM) && GetLocalInt(OBJECT_SELF, "DO_CIRCLE_ONCE") == 0)
       {
            SetLocalInt(OBJECT_SELF, "DO_CIRCLE_ONCE", 1);
            MyCastSpell(SPELL_CIRCLE_OF_DOOM, OBJECT_SELF, METAMAGIC_MAXIMIZE);
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

        // ----------------------------------------------------------------------------------------
        // BK September 2002
        // If a succesful tactic has been chosen then
        // exit this function directly
        // ----------------------------------------------------------------------------------------

        if (chooseTactics(oIntruder) == 99)
        {
            __TurnCombatRoundOn(FALSE);
            return;
        }

        // ----------------------------------------------------------------------------------------
        // This check is to make sure that people do not drop out of
        // combat before they are supposed to.
        // ----------------------------------------------------------------------------------------

        object oNearEnemy = GetNearestSeenEnemy();
        DetermineCombatRound(oNearEnemy);

        return;
    }
     __TurnCombatRoundOn(FALSE);


}

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE)
{
    //SendMessageToPC(GetFirstPC(), "BOOM: Casting: " + GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpell))));
    ActionCastSpellAtObject(nSpell, oTarget, nMetaMagic, bCheat, nDomainLevel, nProjectilePathType, bInstantSpell);
}
