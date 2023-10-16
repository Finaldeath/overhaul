void main()
{
    object oPC = GetLastUsedBy();
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    ExecuteScript("q7_cut702", oPC);
    //SetLocalInt(GetModule(), "X2_ENDING_STATUS", 1);
    //object oWP = GetWaypointByTag("q7b_wp_camera1");
    //AssignCommand(oPC, JumpToObject(oWP));
}
