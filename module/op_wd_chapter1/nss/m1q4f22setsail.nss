void main()
{
    object oPC = GetPCSpeaker();
    object oWaypoint = GetTransitionTarget(OBJECT_SELF);
    location lLocation = GetLocation(oWaypoint);

    SetAreaTransitionBMP(AREA_TRANSITION_CITY);

    AssignCommand(oPC,ClearAllActions());
    AssignCommand(oPC,ActionJumpToLocation(lLocation));
    AssignCommand(oPC,SetFacing(GetFacing(oWaypoint)));
}
