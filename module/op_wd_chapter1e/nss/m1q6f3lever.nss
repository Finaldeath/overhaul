void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    object oDoor = GetNearestObjectByTag("M1Q6F3YariDoor");
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
}
