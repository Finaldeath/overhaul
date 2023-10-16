//Automatically closes the nearest door to the trigger
//Intended for in a trigger's OnExit.

void main()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
    AssignCommand(oDoor, ActionCloseDoor(oDoor));
}
