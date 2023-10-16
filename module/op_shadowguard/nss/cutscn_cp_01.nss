void main()
{
    //Jump the player back to their waypoint, just in case.
    object oPC = GetPCSpeaker();
    object oWP = GetNearestObjectByTag("WP_CUTSCENE");
    AssignCommand(oPC, JumpToObject(oWP));
    AssignCommand(oPC, SetFacing(GetFacing(oWP)));
}
