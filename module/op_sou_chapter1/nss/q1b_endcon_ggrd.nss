//::///////////////////////////////////////////////
//:: Name q1b_endcon_ggrd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have guard return to his post.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 18/03
//:://////////////////////////////////////////////

void main()
{
    object oGuard = GetObjectByTag("q1bgateguard");
    object oTarget = GetWaypointByTag("wp_hilltopgate");
    AssignCommand(oGuard, ActionMoveToObject(oTarget));
    DelayCommand(5.0, AssignCommand(oGuard, SetFacingPoint(GetPosition(GetWaypointByTag("mn_hilltopgate")))));
}
