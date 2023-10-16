void main()
{
    int iNth = 1;
    object oDoor = GetNearestObjectByTag("m1q2C_CellDoor", OBJECT_SELF, iNth);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    ActionStartConversation(OBJECT_SELF);

    while (GetIsObjectValid(oDoor))
    {
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));

        iNth++;
        oDoor = GetNearestObjectByTag("m1q2C_CellDoor", OBJECT_SELF, iNth);
    }
}
