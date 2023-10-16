//::///////////////////////////////////////////////
//:: Chronicles of Abaran - Table of Contents Setup
//:: Chron_Contents.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle all the setup required for returning
     to the Table of Contents.
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

    //Jump to the appropriate waypoint.
    object oWP = GetWaypointByTag("WP_CHRONICLES_START");
    DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oWP)));

    //Set the conversation variable
    SetLocalInt(oPC, "ChroniclesChapter", 0);

    //Relaunch the conversation
    DelayCommand(1.0, AssignCommand(oPC, ActionResumeConversation()));
    DelayCommand(1.1, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_open_1", FALSE, FALSE)));
}
