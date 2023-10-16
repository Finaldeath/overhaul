//::///////////////////////////////////////////////
//:: Name act_q1ruralreb_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rebecca will runs for her farm
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "X1_Q1RuralRebFree", 70);
    SetLocalInt(GetModule(), "X1_Q1RBeckaJumpToFarm", 1);
    object oExit = GetWaypointByTag("wp_q1rbecka_running");
    ActionMoveToObject(oExit, TRUE);
    SetPlotFlag(OBJECT_SELF, TRUE);
    SetCommandable(FALSE);
    DestroyObject(OBJECT_SELF, 5.0);
    location lSpawn = GetLocation(GetWaypointByTag("wp_q1hurst_spnreb"));
    CreateObject(OBJECT_TYPE_CREATURE, "q1ruralrebecca", lSpawn);
}
