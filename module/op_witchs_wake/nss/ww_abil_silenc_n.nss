//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Silence, Normal Int
//:: WW_Abil_Silenc_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is a Bard or
    Cleric, or is currently capable of casting
    Silence through some other means. Normal
    Intelligence variant.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Sept 3, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iBard = GetLevelByClass(CLASS_TYPE_BARD, oPC);
    int iCleric = GetLevelByClass(CLASS_TYPE_CLERIC, oPC);
    int bHasSilence = GetHasSpell(SPELL_SILENCE, oPC);

    if (iBard > 0     ||
        iCleric > 0   ||
        bHasSilence == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
