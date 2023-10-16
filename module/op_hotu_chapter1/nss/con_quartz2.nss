//::///////////////////////////////////////////////
//:: FileName con_quartz1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/10/2002 10:37:15 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
	if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE) < 9))
		return FALSE;

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "NW_IT_MSMLMISC11"))
		return FALSE;

	return TRUE;
}
