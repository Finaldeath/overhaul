//::///////////////////////////////////////////////
//:: FileName sc_001
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/15/2003 1:19:09 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "ear") == 1))
		return FALSE;

	return TRUE;
}