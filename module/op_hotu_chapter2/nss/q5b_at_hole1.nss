// Area transtion to lower tunnels

void main()
{
    object oPC = GetPCSpeaker();
    object oWP = GetWaypointByTag("q5c_wp_arrive");
    AssignCommand(oPC, JumpToObject(oWP));
}
