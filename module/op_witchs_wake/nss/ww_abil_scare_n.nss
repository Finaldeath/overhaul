//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Scare, Normal Int
//:: WW_Abil_Scare_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is a Bard, Cleric,
    Sorcerer, or Wizard or is currently capable of
    casting Scare through some other means. Normal
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
    int iSorcerer = GetLevelByClass(CLASS_TYPE_SORCERER, oPC);
    int iWizard = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int bHasScare = GetHasSpell(SPELL_SCARE, oPC);

    if (iBard > 0     ||
        iCleric > 0   ||
        iSorcerer > 0 ||
        iWizard > 0   ||
        bHasScare == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
