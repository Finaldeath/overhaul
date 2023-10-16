// jump player back to tomb entrance

void main()
{
    object oPC = GetLastUsedBy();
    object oWP = GetWaypointByTag("Q2D_WP_ENTRANCE");
    AssignCommand(oPC, JumpToObject(oWP));
}
