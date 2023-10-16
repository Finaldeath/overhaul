//::///////////////////////////////////////////////
//:: Default On Attacked
//:: NW_C2_DEFAULT5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
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
    if (GetLocalInt(GetArea(OBJECT_SELF), "X1_JumpersHostile") != 1)
    {
        object oPC = GetLastHostileActor();
        if (GetIsPC(oPC) == TRUE)
        {
            SetLocalInt(GetArea(OBJECT_SELF), "X1_JumpersHostile", 1);
            int nCount = 0;
            object oKobold = GetObjectByTag("Q5_KOBOLD_JUMPER", nCount);
            while (nCount < 10)
            {
                ChangeToStandardFaction(oKobold, STANDARD_FACTION_HOSTILE);
                AssignCommand(oKobold, DetermineCombatRound(oPC));
                nCount++;
                oKobold = GetObjectByTag("Q5_KOBOLD_JUMPER", nCount);
            }
            object oMaster = GetObjectByTag("Q5_KLUMPH");
            ChangeToStandardFaction(oMaster, STANDARD_FACTION_HOSTILE);
            AssignCommand(oMaster, DetermineCombatRound(oPC));
        }
    }
}
