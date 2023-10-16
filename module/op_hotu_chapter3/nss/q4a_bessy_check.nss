//::///////////////////////////////////////////////
//:: FileName q4a_bessy_check
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/7/2003 9:02:58 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "q4a_bucket_m"))
		return FALSE;

	return TRUE;
}
