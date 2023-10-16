//::///////////////////////////////////////////////
//:: Name
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
    ActionPauseConversation();

    ActionMoveToObject(GetObjectByTag("Drogan"), FALSE);
    AssignCommand(OBJECT_SELF, SetFacingPoint(GetPosition(GetObjectByTag("Drogan"))));
    AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,0.8, 2.0));
    DelayCommand(4.0, ActionResumeConversation());
    AssignCommand(GetObjectByTag("x0_hen_mis"), ActionMoveToObject(GetWaypointByTag("wp_mischa_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_mis"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
    AssignCommand(GetObjectByTag("x0_hen_dor"), ActionMoveToObject(GetWaypointByTag("wp_dorna_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_dor"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
    AssignCommand(GetObjectByTag("x0_hen_xan"), ActionMoveToObject(GetWaypointByTag("wp_xanos_post")));
    DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_xan"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));

    //Make the henchmen not immortal
    object oXan = GetObjectByTag("x0_hen_xan");
    object oDorna = GetObjectByTag("x0_hen_dor");
    SetImmortal(oXan, FALSE);
    SetImmortal(oDorna, FALSE);
}
