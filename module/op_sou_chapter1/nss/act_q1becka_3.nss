//Have rebecca move to the exit
//act_q1becka_3
void main()
{
    object oRebecca = GetObjectByTag("q1ruralrebecca");
    object oExit = GetWaypointByTag("wp_q1rbecka_running");

    AssignCommand(oRebecca, SpeakStringByStrRef(40347));
    AssignCommand(oRebecca, ActionForceMoveToObject(oExit, TRUE, 1.0, 4.0));

    //DelayCommand(1.0, SetCommandable(FALSE, oRebecca));
    SetLocalInt(oRebecca, "nJumpOutsideCave", 1);


}
