//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Remove Fear, Normal Int
//:: WW_Abil_Remove_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is a Cleric or is
    currently capable of casting Remove Fear
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
    int iCleric = GetLevelByClass(CLASS_TYPE_CLERIC, oPC);
    int bHasRemove = GetHasSpell(SPELL_REMOVE_FEAR, oPC);

    if (iCleric > 0 || bHasRemove == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
