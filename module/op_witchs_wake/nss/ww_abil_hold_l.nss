//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Hold Person, Low Int
//:: WW_Abil_Hold_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is a Bard, Cleric,
    Sorcerer, or Wizard or is currently capable of
    casting Hold through some other means. Low
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
    int bHasHold = GetHasSpell(SPELL_HOLD_PERSON, oPC);

    if (iBard > 0     ||
        iCleric > 0   ||
        iSorcerer > 0 ||
        iWizard > 0   ||
        bHasHold == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
