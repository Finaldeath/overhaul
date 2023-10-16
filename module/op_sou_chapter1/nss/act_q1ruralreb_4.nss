//::///////////////////////////////////////////////
//:: Name act_q1ruralreb_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rebecca will run for the exit. Everyone happy
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void JumpToFarm(object oPC);
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(GetModule(), "X1_Q1RuralRebFree", 70);
    SetLocalInt(GetModule(), "X1_PCBeccaEscape", 2);

    SetLocalInt(GetModule(), "X1_Q1RBeckaJumpToFarm", 1);
    SetLocalInt(GetModule(), "X1_PCBeccaEscape", 2);
    object oExit = GetWaypointByTag("wp_q1rbecka_running2");
    ActionMoveToObject(oExit, TRUE);
    SetPlotFlag(OBJECT_SELF, TRUE);
    SetCommandable(FALSE);

    DelayCommand(5.0, JumpToFarm(OBJECT_SELF));


}
void JumpToFarm(object oPC)
{
    SetCommandable(TRUE);
    /*object oSpawn = GetWaypointByTag("wp_q1hurst_spnreb");
    object oReb = OBJECT_SELF;
    JumpToObject(oSpawn);
    DelayCommand(1.0, AssignCommand(oReb, ClearAllActions(TRUE)));
    DelayCommand(2.0, SetPlotFlag(oReb, FALSE));
    */
    DestroyObject(OBJECT_SELF, 5.0);
    location lSpawn = GetLocation(GetWaypointByTag("wp_q1hurst_spnreb"));
    CreateObject(OBJECT_TYPE_CREATURE, "q1ruralrebecca", lSpawn);
    RewardXP("xpmid",50,oPC);
}

