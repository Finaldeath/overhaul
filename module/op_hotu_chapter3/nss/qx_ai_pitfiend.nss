// Pit Fiend's custom AI

#include "nw_i0_generic"

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE);
void CastSpell(object oIntruder, int nClose = FALSE);

int IsDifficult()
{
    return (GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES ||
           GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT);
}

void TeleportVis(object oWP)
{
    effect eVis = EffectVisualEffect(VFX_FNF_LOS_EVIL_10);
    location lLoc;
    vector vPos = GetPosition(oWP);
    float fDelay;
    int i;
    for(i = 1; i <= 26; i++)
    {
        vPos.z += 0.3;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
        DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc));
        fDelay += 0.04;
    }
}

void Teleport(int bHeal, object oIntruder)
{
    PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
    //effect eIn = EffectVisualEffect(VFX_IMP_HARM);
    //effect eOut = EffectVisualEffect(VFX_IMP_HARM);
    // Knockdown any nearby creatures
    effect eKnock = EffectKnockdown();
    int i = 1;
    int nDur;
    float fDistance;
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    while(oCreature != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oCreature);
        if(fDistance > 10.0)
            break;
        nDur = d4(1);
        AssignCommand(oCreature, ClearAllActions());
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oCreature, IntToFloat(nDur));
        i++;
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    }


    int nRand = Random(3);
    ClearAllActions();
    location lLoc = GetLocation(OBJECT_SELF);
    object oWP = GetNearestObjectByTag("yj_wp_devil_join", OBJECT_SELF, nRand + 8);
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, eOut, OBJECT_SELF);
    TeleportVis(OBJECT_SELF);
    JumpToObject(oWP);
    //DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eIn, GetLocation(oWP)));
    DelayCommand(1.0, TeleportVis(oWP));

    if(bHeal)
    {
        if(GetLocalInt(OBJECT_SELF, "USED_HELLBALL") == 0)
        {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
            SetLocalInt(OBJECT_SELF, "USED_HELLBALL", 1);
            MyCastSpell(SPELL_EPIC_HELLBALL, oIntruder, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
            //DecrementRemainingFeatUses(OBJECT_SELF, FEAT_EPIC_SPELL_HELLBALL);
            //ActionUseFeat(FEAT_EPIC_SPELL_HELLBALL, OBJECT_SELF);

        }
        if(GetHasSpell(SPELL_CURE_CRITICAL_WOUNDS))
        {
            DelayCommand(1.5, MyCastSpell(SPELL_CURE_CRITICAL_WOUNDS, OBJECT_SELF));
        }
    }
    else
        DelayCommand(1.5, DetermineCombatRound());
}

int NearAoe(object oIntruder)
{
    int nLocValid = GetLocalInt(OBJECT_SELF, "LOC_VALID");
    if(nLocValid == 0)
        return FALSE;
    location lLast = GetLocalLocation(OBJECT_SELF, "LAST_AOE");
    return (GetDistanceBetweenLocations(lLast, GetLocation(oIntruder)) <= 3.0);
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

    // Immunity to silence:
    object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR);
    itemproperty ipSilence = ItemPropertySpellImmunitySpecific(IP_CONST_IMMUNITYSPELL_SILENCE);
    AddItemProperty(DURATION_TYPE_PERMANENT, ipSilence, oHide);


    /*
    - Instant cast Aura of Hellfire
    - Cast Greater Dispelling
    - Cast Spell Mantle if does not have one active
    - Cast Hell Inferno
    - If wounded then try to use talent heal
    - If has close enemy: 50% of melee fight, 25% of teleporting away, 25% of spell
    - If has ranged enemy: 75% cast spell, 25% melee attack
    */

   if(GetLocalInt(OBJECT_SELF, "DO_INSTANT_ONCE") == 0)
   {
       SetLocalInt(OBJECT_SELF, "DO_INSTANT_ONCE", 1);
       ActionCastSpellAtObject(761, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_SPELL_MANTLE, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_BATTLETIDE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);

       //ActionCastSpellAtObject(SPELL_HASTE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       //ActionCastSpellAtObject(SPELL_DISPLACEMENT, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       effect eHaste = EffectHaste();
       effect eConceal;
       if(IsDifficult())
           eConceal = EffectConcealment(75);
       else
           eConceal = EffectConcealment(50);
       effect eVis = EffectVisualEffect(VFX_DUR_BLUR);
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHaste, OBJECT_SELF);
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eConceal, OBJECT_SELF, RoundsToSeconds(25));
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF, RoundsToSeconds(25));
       MyCastSpell(SPELL_GREATER_DISPELLING, oIntruder);
       __TurnCombatRoundOn(FALSE);
           return;
   }
   if(GetHasSpell(SPELL_SPELL_MANTLE) && !GetHasSpellEffect(SPELL_SPELL_MANTLE))
   {
        ActionCastSpellAtObject(SPELL_SPELL_MANTLE, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        __TurnCombatRoundOn(FALSE);
           return;
   }

   if(GetHasSpell(762))
   {
        MyCastSpell(762, oIntruder);
        __TurnCombatRoundOn(FALSE);
           return;
   }
   int nTeleport = GetLocalInt(OBJECT_SELF, "TELEPORT");
   float fHP = IntToFloat(GetCurrentHitPoints()) / IntToFloat(GetMaxHitPoints());
   if(fHP < 0.5)
   {
        if(nTeleport == 0)
        {
            SetLocalInt(OBJECT_SELF, "TELEPORT", 1);
            Teleport(TRUE, oIntruder);
            DelayCommand(12.0, SetLocalInt(OBJECT_SELF, "TELEPORT", 0));
        }
        else
        {
            if(GetHasSpell(SPELL_CURE_CRITICAL_WOUNDS))
            {
                MyCastSpell(SPELL_CURE_CRITICAL_WOUNDS, OBJECT_SELF);
            }
        }
        __TurnCombatRoundOn(FALSE);
        return;

   }
   float fDistance = GetDistanceBetween(OBJECT_SELF, oIntruder);
   int nSpellPr = GetLocalInt(OBJECT_SELF, "SPELL_PRIORITY"); // spell priority (should be high at the beginning)
   int nRand = Random(100) + 1;
   nRand += nSpellPr;
   if(fDistance < 6.0) // close range enemy
   {
        if(nRand <= 15 && IsDifficult()) // Knockdown
        {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY2);
            ActionUseFeat(FEAT_KNOCKDOWN, oIntruder);
        }
        else if(nRand <= 30) // normal melee
        {
            ActionAttack(oIntruder);
        }
        else if(nRand <= 70 && nTeleport == 0) // teleport away
        {
            SetLocalInt(OBJECT_SELF, "TELEPORT", 1);
            Teleport(FALSE, oIntruder);
            DelayCommand(12.0, SetLocalInt(OBJECT_SELF, "TELEPORT", 0));
        }
        else // cast spell
        {
            CastSpell(oIntruder, TRUE);
            nSpellPr -= 10;
            SetLocalInt(OBJECT_SELF, "SPELL_PRIORITY", nSpellPr);
        }
        __TurnCombatRoundOn(FALSE);
        return;
   }
   else // long range enemy
   {
        if(nRand <= 20) // charge
        {
            ActionAttack(oIntruder);
        }
        else // charge
        {
            CastSpell(oIntruder);
            nSpellPr -= 10;
            SetLocalInt(OBJECT_SELF, "SPELL_PRIORITY", nSpellPr);
        }
        __TurnCombatRoundOn(FALSE);
           return;
   }

   __TurnCombatRoundOn(FALSE);


}

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE)
{
    //SendMessageToPC(GetFirstPC(), "BOOM: Casting: " + GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpell))));
    ActionCastSpellAtObject(nSpell, oTarget, nMetaMagic, bCheat, nDomainLevel, nProjectilePathType, bInstantSpell);
}

void CastSpell(object oIntruder, int bClose)
{
   float fDistance = GetDistanceBetween(oIntruder, OBJECT_SELF);
   // 50% for aoe spell, 25% for group spell and 25% for single target spell
   int nRand = Random(100) + 1;
   if(nRand <= 40) // aoe spell
   {
       if(GetHasSpell(SPELL_INCENDIARY_CLOUD) && !NearAoe(oIntruder))
       {
            // storing location of last aoe we won't cast another one nearby
            SetLocalLocation(OBJECT_SELF, "LAST_AOE", GetLocation(oIntruder));
            SetLocalInt(OBJECT_SELF, "LOC_VALID", 1);
            DelayCommand(60.0, DeleteLocalLocation(OBJECT_SELF, "LAST_AOE"));
            DelayCommand(60.0, DeleteLocalInt(OBJECT_SELF, "LOC_VALID"));
            MyCastSpell(SPELL_INCENDIARY_CLOUD, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetHasSpell(SPELL_WALL_OF_FIRE) && !NearAoe(oIntruder))
       {
            SetLocalLocation(OBJECT_SELF, "LAST_AOE", GetLocation(oIntruder));
            SetLocalInt(OBJECT_SELF, "LOC_VALID", 1);
            DelayCommand(60.0, DeleteLocalLocation(OBJECT_SELF, "LAST_AOE"));
            DelayCommand(60.0, DeleteLocalInt(OBJECT_SELF, "LOC_VALID"));
            MyCastSpell(SPELL_WALL_OF_FIRE, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       nRand += 50;
   }
   if(nRand <= 75) // group spell
   {
       if(bClose)
       {
           if(GetHasSpell(SPELL_FIRE_STORM))
           {
                MyCastSpell(SPELL_FIRE_STORM, oIntruder);
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
       if(GetHasSpell(SPELL_METEOR_SWARM) && fDistance <= 15.0)
       {
           MyCastSpell(SPELL_METEOR_SWARM, OBJECT_SELF);
           __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetLocalInt(OBJECT_SELF, "USED_HELLBALL") == 0 && fDistance > 20.0)
       {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY3);
            SetLocalInt(OBJECT_SELF, "USED_HELLBALL", 1);
            MyCastSpell(SPELL_EPIC_HELLBALL, oIntruder, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
            //DecrementRemainingFeatUses(OBJECT_SELF, FEAT_EPIC_SPELL_HELLBALL);
            //ActionUseFeat(FEAT_EPIC_SPELL_HELLBALL, OBJECT_SELF);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetHasSpell(SPELL_CALL_LIGHTNING))
       {
            MyCastSpell(SPELL_CALL_LIGHTNING, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetHasSpell(SPELL_FIREBALL))
       {
            MyCastSpell(SPELL_FIREBALL, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetLocalInt(OBJECT_SELF, "USED_HELLBALL") == 0)
       {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
            SetLocalInt(OBJECT_SELF, "USED_HELLBALL", 1);
            MyCastSpell(SPELL_EPIC_HELLBALL, oIntruder, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
            //DecrementRemainingFeatUses(OBJECT_SELF, FEAT_EPIC_SPELL_HELLBALL);
            //ActionUseFeat(FEAT_EPIC_SPELL_HELLBALL, OBJECT_SELF);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetHasSpell(SPELL_FIRE_STORM))
       {
            MyCastSpell(SPELL_FIRE_STORM, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }

       nRand += 25;

   }
   if(nRand <= 100) // single target
   {
       if(GetLocalInt(OBJECT_SELF, "USED_RUIN") == 0)
       {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
            SetLocalInt(OBJECT_SELF, "USED_RUIN", 1);
            MyCastSpell(SPELL_EPIC_RUIN, oIntruder, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
            //ActionUseFeat(FEAT_EPIC_SPELL_RUIN, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }


       if(GetHasSpell(SPELL_FLAME_STRIKE))
       {
            MyCastSpell(SPELL_FLAME_STRIKE, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetHasSpell(SPELL_INFESTATION_OF_MAGGOTS))
       {
            MyCastSpell(SPELL_INFESTATION_OF_MAGGOTS, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetHasSpell(SPELLABILITY_BOLT_FIRE))
       {
            MyCastSpell(SPELLABILITY_BOLT_FIRE, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }
       if(GetHasSpell(SPELL_FLAME_LASH))
       {
            MyCastSpell(SPELL_FLAME_LASH, oIntruder);
            __TurnCombatRoundOn(FALSE);
               return;
       }

   }
   if(GetLocalInt(OBJECT_SELF, "USED_HELLBALL") == 0)
       {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
            SetLocalInt(OBJECT_SELF, "USED_HELLBALL", 1);
            MyCastSpell(SPELL_EPIC_HELLBALL, oIntruder, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
            //DecrementRemainingFeatUses(OBJECT_SELF, FEAT_EPIC_SPELL_HELLBALL);
            //ActionUseFeat(FEAT_EPIC_SPELL_HELLBALL, OBJECT_SELF);
            __TurnCombatRoundOn(FALSE);
               return;
       }
   if(GetHasSpell(SPELL_METEOR_SWARM))
           {
                MyCastSpell(SPELL_METEOR_SWARM, oIntruder);
                __TurnCombatRoundOn(FALSE);
                    return;
           }

   ActionAttack(oIntruder);
   __TurnCombatRoundOn(FALSE);
           return;
}
