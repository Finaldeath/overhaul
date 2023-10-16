//::///////////////////////////////////////////////
//:: FileName con_q4c03vel1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/18/2002 5:49:04 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "q4c09holeygrail"))
		return FALSE;

	return TRUE;
}
