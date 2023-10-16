//Farm hand is fired - goes outside and set Ambush variable.
void main()
{
    object oTarget = GetWaypointByTag("wp_q1ff_farmexit");
    ActionMoveToObject(oTarget, TRUE);
    SetCommandable(FALSE);
    DestroyObject(OBJECT_SELF, 2.5);
    SetLocalInt(GetModule(), "X1_Q1RURALAMBUSH", 1);
}
