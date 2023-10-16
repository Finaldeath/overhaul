//::///////////////////////////////////////////////
//:: Open Host Tower Door
//:: 2Q6A_OpenDoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the door and turns the guards hostile
    if the person using it is not of the same
    faction.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 22, 2002
//:://////////////////////////////////////////////
#include "NW_i0_generic"
#include "NW_I0_HOSTINCL"
void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    object oDoor = GetObjectByTag("2Q6A_HostEnter");
    DelayCommand(2.0, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
    object oUser = GetLastUsedBy();

    if(!GetFactionEqual(OBJECT_SELF, oUser))
    {
        AdjustReputation(oUser, OBJECT_SELF, -100);
        object oCapt = GetObjectByTag("2Q6A_GateCapt");
        if(GetIsObjectValid(oCapt))
        {
            SetLocalInt(oCapt, "NW_2Q6_ISLUND_MAD", 1);
            SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT);
            AssignCommand(oCapt, ClearAllActions());
            AssignCommand(oCapt, ActionStartConversation(OBJECT_SELF));
            AssignCommand(oCapt, DetermineCombatRound(oUser));
        }
    }
    HOST_PlayDoorAnimation();
}
