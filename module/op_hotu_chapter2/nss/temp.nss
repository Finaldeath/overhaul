void main()
{
     SetLocalInt(GetModule(), "X2_ENDING_STATUS", 2);
     object oWP = GetWaypointByTag("q7a_wp_camera1");
     AssignCommand(GetFirstPC(), JumpToObject(oWP));
}
