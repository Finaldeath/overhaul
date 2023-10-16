//::///////////////////////////////////////////////
//:: FileName q5_sc_got_diamon
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/14/2003 5:19:35 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "NW_IT_GEM005"))
		return FALSE;

	return TRUE;
}
