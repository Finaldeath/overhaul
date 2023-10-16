//::///////////////////////////////////////////////
//:: Chronicles of Abaran - Chapter 6 Setup
//:: Chron_Ch6.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle all the setup required for Chapter 6.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 16, 2004
//:://////////////////////////////////////////////
#include "inc_rob"

void main()
{
    //Snap to black (b/c we don't know if it's already black or not).
    object oPC = GetPCSpeaker();

    BlackScreen(oPC);
    ActionPauseConversation();

    //Destroy old creatures
    DestroyAllNPCsInArea(GetArea(oPC));

    //Spawn in new creatures.
    SpawnChronicles(6);

    //Jump to the appropriate waypoint.
    object oWP = GetWaypointByTag("WP_CHRONICLES_6");
    DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oWP)));

    //Set the conversation variable
    SetLocalInt(oPC, "ChroniclesChapter", 6);

    //Relaunch the conversation
    DelayCommand(1.0, AssignCommand(oPC, ActionResumeConversation()));
    DelayCommand(1.1, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_open_1", FALSE, FALSE)));

    //Restore the proper camera facing.
    float fFacing = GetFacing(oWP);
    DelayCommand(1.2, AssignCommand(oPC, SetCameraFacing(fFacing, 10.0)));
}
