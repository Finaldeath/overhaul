// * Door that golem guards opens
// * at this or when he dies
void main()
{
    object oDoor = GetNearestObjectByTag("M3Q04GolemDoor");
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

}
