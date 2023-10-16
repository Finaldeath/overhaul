//::///////////////////////////////////////////////
//:: Default On Attacked
//:: q2d_atk_illcreat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
    Illusionary creatures will vanish when attacked
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    if(GetFleeToExit()) {
        // Run away!
        ActivateFleeToExit();
    } else if (GetSpawnInCondition(NW_FLAG_SET_WARNINGS)) {
        // We give an attacker one warning before we attack
        // This is not fully implemented yet
        SetSpawnInCondition(NW_FLAG_SET_WARNINGS, FALSE);

        //Put a check in to see if this attacker was the last attacker
        //Possibly change the GetNPCWarning function to make the check
    } else {
        object oAttacker = GetLastAttacker();
        if (!GetIsObjectValid(oAttacker)) {
            // Don't do anything, invalid attacker

        } else if (!GetIsFighting(OBJECT_SELF)) {
            // We're not fighting anyone else, so
            // start fighting the attacker
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
                SetSummonHelpIfAttacked();
                DetermineSpecialBehavior(oAttacker);
            } else if (GetArea(oAttacker) == GetArea(OBJECT_SELF)) {
                SetSummonHelpIfAttacked();
                DetermineCombatRound(oAttacker);
            }

            //Shout Attack my target, only works with the On Spawn In setup
            SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

            //Shout that I was attacked
            SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
        }
    }


    if(GetSpawnInCondition(NW_FLAG_ATTACK_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_ATTACKED));
    }

    object oPC = GetLastAttacker();
    if (GetIsPC(oPC) == TRUE)
    {
        if (WillSave(oPC, 25, SAVING_THROW_TYPE_SPELL) > 0)
        {
            FloatingTextStrRefOnCreature(85719, oPC);//"This Creature was only an illusion!"
            location lSpawn = GetLocation(OBJECT_SELF);
            effect eVis1 = EffectVisualEffect(VFX_FNF_PWSTUN);
            effect eVis2 = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
            effect eLink = EffectLinkEffects(eVis1, eVis2);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lSpawn);
            DestroyObject(OBJECT_SELF);
        }
    }
}
