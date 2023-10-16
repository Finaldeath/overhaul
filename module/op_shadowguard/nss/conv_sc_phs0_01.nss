void main()
{
    object oWP = GetNearestObjectByTag("WP_CT_COMM_PH_DOORMAN");
    location lWP = GetLocation(oWP);

    object oDoor = GetNearestObjectByTag("DOOR_ST_0_NC_LAIR_01");
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

    AssignCommand(OBJECT_SELF, ActionMoveToLocation(GetLocation(oDoor), TRUE));
    AssignCommand(OBJECT_SELF, ActionMoveToLocation(lWP));
}
