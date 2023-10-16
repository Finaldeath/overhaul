//::///////////////////////////////////////////////
//:: FileName hx_ringpc_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/25/2003 4:57:51 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "hx_ringpiece_1"))
		return FALSE;
	if(!HasItem(GetPCSpeaker(), "hx_ringpiece_2"))
		return FALSE;
	if(!HasItem(GetPCSpeaker(), "hx_ringpiece_3"))
		return FALSE;

	return TRUE;
}
