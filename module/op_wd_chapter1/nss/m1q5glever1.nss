void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    if (GetLocalInt(OBJECT_SELF,"NW_L_Pulled") == FALSE)
    {
        object oDoor = GetNearestObjectByTag("M1Q5GDoor1");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        ActionStartConversation(OBJECT_SELF);
        SetLocalInt(OBJECT_SELF,"NW_L_Pulled",TRUE);
    }
}
