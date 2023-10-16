// ghost room lever - open and close the door.

void main()
{
    object oDoor = GetNearestObjectByTag("q4c_jail_door");
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    if(!GetIsOpen(oDoor))
    {
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
    }
    else
    {
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
    }

}
