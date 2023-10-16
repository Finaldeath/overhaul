//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Rage, Normal Int
//:: WW_Abil_Rage_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is a Barbarian or
    currently capable of using the Rage feat
    through some other means. Normal Intelligence
    variant.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Sept 3, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iBarbarian = GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC);
    int bHasRage = GetHasFeat(FEAT_BARBARIAN_RAGE, oPC);

    if (iBarbarian >0 || bHasRage == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
