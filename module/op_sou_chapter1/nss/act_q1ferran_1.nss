//::///////////////////////////////////////////////
//:: Name  act_q1ferran_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
ferran sits down by the fire (play the ANIMATION_LOOPING_SIT_CROSS animation)
and the PC joins him by his fire
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 6/03
//:://////////////////////////////////////////////

void main()
{

    object oFerranSit = GetWaypointByTag("wp_q1ferran_sit");
    object oPCSit = GetWaypointByTag("wp_q1rural_pcsit");
    object oPC = GetPCSpeaker();
    object oFerran = GetObjectByTag("q1ferran");

    AssignCommand(oPC, ActionPauseConversation());

    //Ferran and pc move to sit down
    ActionMoveToObject(oFerranSit);
    AssignCommand(oPC, ActionMoveToObject(oPCSit));
    //ferran turns and sits
    DelayCommand(5.5, SetFacingPoint(GetPosition(oPC)));
    //DelayCommand(1.8, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 120.0));
    //pc faces ferran
    DelayCommand(5.0, AssignCommand(oPC, SetFacingPoint(GetPosition(oFerran))));
    //DelayCommand(2.4, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 6.0)));

    //object oHenchman = GetHenchman(oPC);
    //if (oHenchman != OBJECT_INVALID)
    //   DelayCommand(1.2, AssignCommand(oHenchman, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 12.0)));

    DelayCommand(5.3, AssignCommand(oPC, ActionResumeConversation()));

}
