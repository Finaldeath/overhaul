//::///////////////////////////////////////////////
//:: Chronicles of Abaran - Chapter 3 Setup
//:: Chron_Ch3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle all the setup required for Chapter 3.
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
    SpawnChronicles(3);

    //Jump to the appropriate waypoint.
    object oWP = GetWaypointByTag("WP_CHRONICLES_3");
    DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oWP)));

    //Set the conversation variable
    SetLocalInt(oPC, "ChroniclesChapter", 3);

    //Relaunch the conversation
    DelayCommand(1.0, AssignCommand(oPC, ActionResumeConversation()));
    DelayCommand(1.1, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_open_1", FALSE, FALSE)));

    //Restore the proper camera facing.
    float fFacing = GetFacing(oWP);
    DelayCommand(1.2, AssignCommand(oPC, SetCameraFacing(fFacing, 10.0)));

}
