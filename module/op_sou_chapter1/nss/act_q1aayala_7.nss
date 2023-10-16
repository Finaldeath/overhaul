//::///////////////////////////////////////////////
//:: Name act_q1aayala_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Move the NPCs to their places
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 6/03
//:://////////////////////////////////////////////

void main()
{

    AssignCommand(GetObjectByTag("x0_hen_mis"), ActionMoveToObject(GetWaypointByTag("wp_mischa_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_mis"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
    AssignCommand(GetObjectByTag("x0_hen_dor"), ActionMoveToObject(GetWaypointByTag("wp_dorna_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_dor"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
    AssignCommand(GetObjectByTag("x0_hen_xan"), ActionMoveToObject(GetWaypointByTag("wp_xanos_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_xan"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
    SetLocalInt(GetModule(), "X1_Q1AAYALATALK", 1);
}
