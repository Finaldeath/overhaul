//::///////////////////////////////////////////////
//:: FileName q4a_don_rdy2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/9/2003 10:56:11 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "donan_ready") == 1))
		return FALSE;

	return TRUE;
}
