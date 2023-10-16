void main()
{
    SetLocalInt(GetModule(), "N_MODULE_STAGE", 1);

    string s = "WP_STAGE_1_JUMP";

    object oWP = GetWaypointByTag(s);
    location lWP = GetLocation(oWP);

    AssignCommand(GetPCSpeaker(), JumpToLocation(lWP));
}
