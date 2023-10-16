//::///////////////////////////////////////////////
//:: Becket Leaves
//:: q2a_env_leavebeck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sir Becket leaves.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oBecket = GetObjectByTag("q2_sirbecket");
    object oWay = GetObjectByTag("q2ac_at_q2ac5");
    object oHome = GetObjectByTag("q2c5_way_bechome");

    AssignCommand(oBecket, ClearAllActions(TRUE));
    AssignCommand(oBecket, ActionForceMoveToObject(oWay, FALSE, 0.0f, 10.0f));
    AssignCommand(oBecket, ActionJumpToObject(oHome));
}
