void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    if(GetLocalInt(OBJECT_SELF,"NW_L_Pulled") == FALSE)
    {
        object oDoor = GetNearestObjectByTag("M1Q5GDoor2");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        ActionStartConversation(OBJECT_SELF);
        SetLocalInt(OBJECT_SELF,"NW_L_Pulled",TRUE);
    }
}
