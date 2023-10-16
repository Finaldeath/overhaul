void main()
{
    object oPC = GetPCSpeaker();
    object oWaypoint = GetObjectByTag("WP_M1Q4D_M1Q4C");
    location lLocation = GetLocation(oWaypoint);

    SetAreaTransitionBMP(AREA_TRANSITION_CITY);

    AssignCommand(oPC,ClearAllActions());
    AssignCommand(oPC,ActionJumpToLocation(lLocation));
    AssignCommand(oPC,SetFacing(GetFacing(oWaypoint)));
}
