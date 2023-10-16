// Drogan walks away and starts casting spells at the portal

void main()
{
    object oWalkWP = GetNearestObjectByTag("Q3B_WP_DROGAN_CAST");
    object oCastWP = GetWaypointByTag("Q3B_WP_SAND_PORTAL");

    ClearAllActions();
    ActionMoveToObject(oWalkWP);
    ActionDoCommand(SetFacingPoint(GetPosition(oCastWP)));
    ActionDoCommand(SetLocalInt(OBJECT_SELF, "Q2B_CASTING", 1)); // used in drogan's HB event
    SetCommandable(FALSE);
    SetLocalInt(OBJECT_SELF, "DIALOG_STATUS", 2);
}
