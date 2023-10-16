//::///////////////////////////////////////////////
//:: Check Charisma Not High and Int Normal
//:: NW_D2_CHRNH_INTN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has charisma 14 or less
    and normal intelligence
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iCha = GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA);
    if (iCha < 15)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
