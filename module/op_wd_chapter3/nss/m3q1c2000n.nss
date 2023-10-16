//::///////////////////////////////////////////////
//:: Check for Normal IQ and has 2000 gold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{
int l_iResult;

l_iResult = GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) > 8
    && HasGold(2000, GetPCSpeaker());
return l_iResult;
}
