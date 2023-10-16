// Opens a door that has the same tag as the lever without the _LEVER prefix

void main()
{
    int nLen = GetStringLength(GetTag(OBJECT_SELF));
    int nNewLen = nLen - 6; // _LEVER len = 6
    string sDoorTag = GetStringLeft(GetTag(OBJECT_SELF), nNewLen);
    object oDoor = GetNearestObjectByTag(sDoorTag);
    int nOpen = GetLocalInt(oDoor, "OPEN");
    if(nOpen == 0)
    {
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        SetLocalInt(oDoor, "OPEN", 1);
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
    else
    {
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
        //SetLocked(oDoor, TRUE);
        SetLocalInt(oDoor, "OPEN", 0);
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    }
}
