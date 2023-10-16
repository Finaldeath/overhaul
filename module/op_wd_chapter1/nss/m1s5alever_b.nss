void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    ActionStartConversation(OBJECT_SELF);
    int nNth = 1;
    object oDoor = GetNearestObjectByTag("M1S5AInnerDoor",OBJECT_SELF,nNth);
    while(GetIsObjectValid(oDoor))
    {
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        SetLocked(oDoor,FALSE);
        nNth++;
        oDoor = GetNearestObjectByTag("M1S5AInnerDoor",OBJECT_SELF,nNth);
    }
}
