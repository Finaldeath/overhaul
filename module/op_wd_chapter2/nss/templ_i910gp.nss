//::///////////////////////////////////////////////
//:: Intelligence 9+ Has 10 GP
//:: TEMPL_I910GP
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a low normal int
    and has 25 gp
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;
    l_iResult = GetAbilityScore(GetPCSpeaker(),ABILITY_INTELLIGENCE);
    if (l_iResult > 8)
    {
        return (HasGold(25,GetPCSpeaker()));
    }
    return FALSE;
}

