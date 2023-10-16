// teleport user back to tunnels below camp

void main()
{
    object oWP = GetWaypointByTag("Q1_WP_TUNNELS");
    object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
    if(GetLocalObject(oZidan, "Q1_FOLLOW") == GetLastUsedBy())
        AssignCommand(oZidan, JumpToObject(oWP));
    AssignCommand(GetLastUsedBy(), JumpToObject(oWP));
}
