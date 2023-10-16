//::///////////////////////////////////////////////
//:: Tower Doors (OnFailToOpen)
//:: FtO_TowerDoors.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Inform the player that their collar prevents
     them from going further.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bLocked = GetLocked(OBJECT_SELF);
    if (bLocked == TRUE)
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionStartConversation(oPC, "towerdoors", TRUE, FALSE));
    }
}
