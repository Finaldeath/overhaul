//::///////////////////////////////////////////////
//:: Conversation
//:: FinishPlot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:John Winski
//:: Created On: June 17, 2002
//:://////////////////////////////////////////////
void Jump(object oWaypoint)
{
    ClearAllActions();
    JumpToObject(oWaypoint);
}


void main()
{
    object oWaypoint1 = GetObjectByTag("WP_End1");
    object oWaypoint2 = GetObjectByTag("WP_End2");
    object oPC = GetPCSpeaker();
    location lLoc = GetLocation(GetObjectByTag("WakeTrigger"));

    CreateObject(OBJECT_TYPE_PLACEABLE, "endportal", lLoc);
    AssignCommand(oPC, Jump(oWaypoint1));
    ActionJumpToObject(oWaypoint2);
}
