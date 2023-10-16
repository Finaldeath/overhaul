//move mindflayer to his post
//act_q2d2hallgd_3
void main()
{
    object oPC = GetPCSpeaker();
    object oPost = GetWaypointByTag("wp_q2d2_hallguard_post");
    ActionMoveToObject(oPost, FALSE);
    ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
}
