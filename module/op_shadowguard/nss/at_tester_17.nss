void main()
{
    int n = GetLocalInt(GetModule(), "N_MODULE_STAGE");

    string s = "WP_STAGE_" + IntToString(n) + "_JUMP";

    object oWP = GetWaypointByTag(s);
    location lWP = GetLocation(oWP);

    AssignCommand(GetPCSpeaker(), JumpToLocation(lWP));
}
