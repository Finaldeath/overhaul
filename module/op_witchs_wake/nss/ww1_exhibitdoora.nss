//::///////////////////////////////////////////////
//:: Witchwork 1: Guild Exhibit Door, Action
//:: WW1_ExhbitDoorA.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Open the door for the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocked(OBJECT_SELF, FALSE);
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionOpenDoor(OBJECT_SELF));
}
