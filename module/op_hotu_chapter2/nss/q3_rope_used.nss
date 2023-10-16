// climb rope

void main()
{
    object oPC = GetLastUsedBy();
    object oWP = GetWaypointByTag("q3b_wp_pit_arrive");
    AssignCommand(oPC, JumpToObject(oWP));
}
