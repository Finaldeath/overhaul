// prevent hostile gnolls from entering: jump them to the other side of the gate and close it.

void main()
{
    object oWP = GetWaypointByTag("Q3A_WP_CLOSE_GATE");
    object oGate = GetObjectByTag("Q3_GNOLL_HALL_DOOR");
    object oGnoll = GetEnteringObject();

    int nGuard = GetLocalInt(oGnoll, "Q3_GUARD"); // any gnoll in the room is flaged as guard
    if(nGuard == 1)
        return; // no need to stop these ones.


    // only consider gnolls
    if(GetStringLeft(GetTag(oGnoll), 8) == "Q3_GNOLL")
    {
        AssignCommand(oGnoll, ClearAllActions());
        AssignCommand(oGnoll, ActionJumpToObject(oWP));
        //AssignCommand(oGnoll, ActionDoCommand(ClearAllActions()));
        AssignCommand(oGnoll, ActionCloseDoor(oGate));
        AssignCommand(oGnoll, ActionDoCommand(ClearAllActions()));
     }
}
