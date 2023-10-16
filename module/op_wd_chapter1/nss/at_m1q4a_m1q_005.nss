void main()
{
    object oidEntered = GetClickingObject();
    object oidWaypoint = GetTransitionTarget(OBJECT_SELF);
    location lLoc = GetLocation(oidWaypoint);

    if (GetLocalInt(GetModule(),"NW_G_M1Q4SewerGrate"))
    {
        SetAreaTransitionBMP(AREA_TRANSITION_CITY);

        AssignCommand(oidEntered,ClearAllActions());
        AssignCommand(oidEntered,ActionJumpToLocation(lLoc));
        AssignCommand(oidEntered,SetFacing(GetFacing(oidWaypoint)));
    }
    else
    {
        SpeakOneLinerConversation("M1Q4AGrate");
    }
}
