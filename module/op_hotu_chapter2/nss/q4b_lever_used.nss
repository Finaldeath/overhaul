// open plot door

void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    object oDoor = GetNearestObjectByTag("q4b_PlotDoor");
    if(GetIsOpen(oDoor))
    {
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
    }
    else
    {
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
    }
}
