//::///////////////////////////////////////////////
//:: Name  act_q1ferran_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
ferran sits down by the fire (play the ANIMATION_LOOPING_SIT_CROSS animation)
while the PC remains standing
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 6/03
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    object oFerranSit = GetWaypointByTag("wp_q1ferran_sit");
    object oPC = GetPCSpeaker();

    //Ferran and pc move to sit down
    ActionMoveToObject(oFerranSit);
    //ferran turns and sits
    DelayCommand(1.5, SetFacingPoint(GetPosition(oPC)));
    //DelayCommand(1.8, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 120.0));

    DelayCommand(2.2, ActionResumeConversation());
}
