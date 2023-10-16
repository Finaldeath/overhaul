//::///////////////////////////////////////////////
//:: FileName q4a_bucket_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/9/2003 11:07:15 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "q4a_bucket_m"))
		return FALSE;

	return TRUE;
}
