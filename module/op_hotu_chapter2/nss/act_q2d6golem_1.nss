//Golem faces keg and draws a beer..
//act_q2d6golem_1
void main()
{
    object oPC = GetPCSpeaker();
    object oKeg = GetObjectByTag("q2d6keg");

    ActionPauseConversation();
    SetFacingPoint(GetPosition(oKeg));
    ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.0);
    ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
    DelayCommand(2.5, ActionResumeConversation());

}
