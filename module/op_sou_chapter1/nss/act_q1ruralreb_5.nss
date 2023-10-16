//::///////////////////////////////////////////////
//:: Name act_q1ruralreb_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rebecca will run for the exit. Rebecca scared
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(GetModule(), "X1_PCKilledNathan") != 1)
        AddJournalQuestEntry("q1footrumgut", 30, oPC);
    else
        AddJournalQuestEntry("q1footrumgut", 70, oPC);
    SetLocalInt(GetModule(), "X1_Q1RuralRebThreat", 10);
    SetLocalInt(GetModule(), "X1_PCBeccaEscape", 2);
    SetLocalInt(GetModule(), "X1_Q1RBeckaJumpToFarm", 1);
    RewardXP("xpmid",50,GetPCSpeaker());
    object oExit = GetWaypointByTag("wp_q1rbecka_running2");
    ActionMoveToObject(oExit, TRUE);
    SetPlotFlag(OBJECT_SELF, TRUE);
    SetCommandable(FALSE);
    DestroyObject(OBJECT_SELF, 5.0);
    location lSpawn = GetLocation(GetWaypointByTag("wp_q1hurst_spnreb"));
    CreateObject(OBJECT_TYPE_CREATURE, "q1ruralrebecca", lSpawn);
}
