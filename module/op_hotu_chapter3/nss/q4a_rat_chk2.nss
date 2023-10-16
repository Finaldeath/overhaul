//::///////////////////////////////////////////////
//:: FileName q4a_rat_chk2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/14/2003 9:57:10 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "q2bratseeds"))
		return FALSE;

	return TRUE;
}
