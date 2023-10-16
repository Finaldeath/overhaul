void main()
{
    AddHenchman(GetPCSpeaker());

    object oWP = GetNearestObjectByTag("WP_EXIT");

    location lWP = GetLocation(oWP);

    AssignCommand(GetPCSpeaker(), ActionMoveToLocation(lWP));

    SetLocalString(GetPCSpeaker(), "S_ST_2_CURR_QUEST", GetTag(OBJECT_SELF));

    SetLocalString(GetModule(), "S_ST_2_SP_HENCH_QUEST", GetTag(OBJECT_SELF));

    oWP = GetWaypointByTag("WP_S2_VOY_SPWN");

    lWP = GetLocation(oWP);

    AssignCommand(GetPCSpeaker(), DelayCommand(4.0, JumpToLocation(lWP)));
}
