//::///////////////////////////////////////////////
//:: FileName con_q4c03velnis1
//:://////////////////////////////////////////////
//
//     Checks for grail.
//
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/22/2002 2:00:27 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
	if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE) > 8))
		return FALSE;

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "q4c09holeygrail"))
		return FALSE;

	return TRUE;
}
