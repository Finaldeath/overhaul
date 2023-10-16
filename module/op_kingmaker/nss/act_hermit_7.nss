//::///////////////////////////////////////////////
//::
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Hermit enters home.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: September 2003
//:://////////////////////////////////////////////

void main()
{
    object oHermit = GetObjectByTag("q1_thehermit");
    object oWay = GetObjectByTag("q1_way_herment");
    object oHome = GetObjectByTag("NW_HERMITHOME");
    object oDoor = GetObjectByTag("q1ac_at_q3ae");

//    AssignCommand(oHermit,ActionMoveToObject(oWay));
//    AssignCommand(oHermit,ActionJumpToObject(oHome));

    ActionMoveToObject(oWay);
    ActionOpenDoor(oDoor);
    ActionJumpToObject(oHome);
}

