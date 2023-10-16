// Trap on-exit event:
// Prevent leaving the platform if the trap is active

void main()
{
    object oPC = GetExitingObject();
    SetLocalInt(oPC, "Q4D_IN_TRAP", 0);
    if(GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE") == 1)
    {
        object oWP = GetNearestObjectByTag("q4d_wp_block", oPC);
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, JumpToObject(oWP));
    }


}
