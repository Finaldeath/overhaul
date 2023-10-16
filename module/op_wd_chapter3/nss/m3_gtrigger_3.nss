//::///////////////////////////////////////////////
//:: M3_GTRIGGER_3.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This will return the NPC to a starting position if he attempts to leave the
trigger.  You must replace the value of sTag with the tag of the NPC in
question. you must also have a waypoint with the tag "WP_Return_" + NPC's Tag.
This should be placed in the spot the NPC starts at.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May (from Aidan)
//:: Created On: February 28, 2002
//:://////////////////////////////////////////////

void main()
{
    string sTag = "3Q12Guard";
    object oExit = GetExitingObject();
    if(GetTag(oExit) == sTag)
    {
        AssignCommand(oExit,ClearAllActions());
        AssignCommand(oExit,ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + sTag)));
        AssignCommand(oExit,SetFacing(DIRECTION_EAST));
    }
}
