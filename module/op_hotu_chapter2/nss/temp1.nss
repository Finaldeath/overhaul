void main()
{
     SetLocalInt(GetModule(), "X2_ENDING_STATUS", 1);
     object oWP = GetWaypointByTag("q7b_wp_camera1");
     AssignCommand(GetFirstPC(), JumpToObject(oWP));
}
