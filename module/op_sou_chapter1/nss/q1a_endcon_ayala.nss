//::///////////////////////////////////////////////
//:: Name q1a_endcon_ayala
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On abort of Ayala's conversation make sure the
    main quest has been rewarded.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 6/03
//:://////////////////////////////////////////////

void main()
{

    //Have henchmen move to their posts..
    AssignCommand(GetObjectByTag("x0_hen_mis"), ActionMoveToObject(GetWaypointByTag("wp_mischa_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_mis"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
    AssignCommand(GetObjectByTag("x0_hen_dor"), ActionMoveToObject(GetWaypointByTag("wp_dorna_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_dor"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
    AssignCommand(GetObjectByTag("x0_hen_xan"), ActionMoveToObject(GetWaypointByTag("wp_xanos_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_xan"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));

}
