//::///////////////////////////////////////////////
//:: act_cut_tripflee
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip flees
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oTrip = GetObjectByTag("os_cut_trp");
    object oWay = GetObjectByTag("q3ai_way_deadtrp");
    object oDoor = GetNearestObjectByTag("EvilStoneDoor");
    AssignCommand(oTrip,ActionMoveToObject(oDoor));
    AssignCommand(oTrip,ActionOpenDoor(oDoor));
    AssignCommand(oTrip,ActionMoveToObject(oWay,TRUE));
}
