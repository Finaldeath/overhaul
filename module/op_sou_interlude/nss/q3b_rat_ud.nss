// "rat-with-diamond" user-defined event 101:
// cycle through way-points


void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        object oWP1 = GetWaypointByTag("Q3B_WP_RAT1");
        object oWP2 = GetWaypointByTag("Q3B_WP_RAT2");
        object oWP3 = GetWaypointByTag("Q3B_WP_RAT3");
        object oWP4 = GetWaypointByTag("Q3B_WP_RAT4");
        object oWP5 = GetWaypointByTag("Q3B_WP_RAT5");

        ActionForceMoveToObject(oWP1, TRUE, 0.0, 1.0);
        ActionMoveToObject(oWP2, TRUE, 0.0);
        ActionMoveToObject(oWP3, TRUE, 0.0);
        ActionMoveToObject(oWP4, TRUE, 0.0);
        ActionMoveToObject(oWP5, TRUE, 0.0);
        ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(101)));
    }
}
