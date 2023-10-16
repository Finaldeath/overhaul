//::///////////////////////////////////////////////
//:: Name  q2b_exit_archtrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Don't let the archers leave the ambush area
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 17/03
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    if (GetTag(oExiter) == "x2_q2drowarcher1_1" || GetTag(oExiter) == "x2_q2drowarcher1_2"
    || GetTag(oExiter) == "x2_q2drowarcher1_3")
    {
        AssignCommand(oExiter, ClearAllActions());
        object oTarget = GetWaypointByTag("wp_" + GetTag(oExiter));
        AssignCommand(oExiter, ActionMoveToObject(oTarget, TRUE));
        AssignCommand(oExiter, SetFacingPoint(GetPosition(GetWaypointByTag("WP_q2b08rat_06"))));
    }
}
