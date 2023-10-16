//::///////////////////////////////////////////////
//:: FileName conv_it_plot_002
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/15/2003 10:34:03 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "IT_PLOT_002"))
		return FALSE;

	return TRUE;
}
