//::///////////////////////////////////////////////
//:: FileName q3c_sc_machine1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/25/2003 12:10:09 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "q3c_NullifierRod"))
		return FALSE;

	return TRUE;
}
