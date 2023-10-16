// Abort function for cutscene number 10 (telescope attack).

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("wp_cut10_telescope")));
    SetLocalInt(oPC, "X2_SawUnivesityBattle", GetLocalInt(oPC, "X2_SawUnivesityBattle") + 1);

}
