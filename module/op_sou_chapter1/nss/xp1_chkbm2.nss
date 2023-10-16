//::///////////////////////////////////////////////
//:: FileName xp1_chkbm2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 12/4/2002 10:00:10 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "BlackMarket") == 1))
		return FALSE;

	// Restrict based on the player's alignment
	if(GetAlignmentLawChaos(GetPCSpeaker()) != ALIGNMENT_CHAOTIC)
		return FALSE;

	return TRUE;
}
