void main()
{
    object oDoor = GetObjectByTag("M2Q05DGUARDIAN");
    if (GetLocalInt(OBJECT_SELF,"NW_L_Active") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Active",1);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
    }
    else
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Active",0);
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
}
