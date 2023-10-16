//Move slaver into positionfor auction
//act_q2d2slaver_3
void main()
{
    object oFacer = GetObjectByTag("q2d_ill_nur2");
    object oPost = GetObjectByTag("wp_q2d2slaver_post");
    ActionPauseConversation();
    ActionMoveToObject(oPost, FALSE);
    ActionDoCommand(SetFacingPoint(GetPosition(oFacer)));
    DelayCommand(3.0, ActionResumeConversation());


}
