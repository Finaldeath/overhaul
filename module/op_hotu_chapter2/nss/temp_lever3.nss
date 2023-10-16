void main()
{
    object oPC = GetLastUsedBy();
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    SetLocalInt(GetModule(), "X2_ENDING_STATUS", 2);
    object oWP = GetWaypointByTag("q7a_wp_camera1");
    AssignCommand(oPC, JumpToObject(oWP));
}
