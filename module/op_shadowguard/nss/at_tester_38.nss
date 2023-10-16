void main()
{
    SetLocalInt(GetModule(), "N_MODULE_STAGE", 2);

    string s = "WP_STAGE_2_JUMP";

    object oWP = GetWaypointByTag(s);
    location lWP = GetLocation(oWP);

    AssignCommand(GetPCSpeaker(), JumpToLocation(lWP));
}
