void main()
{
    object oTarget = GetObjectByTag("q7b_wp_camera1");
    SetLocalInt(GetModule(), "X2_ENDING_STATUS", 1);
    AssignCommand(GetFirstPC(), JumpToObject(oTarget));

}
