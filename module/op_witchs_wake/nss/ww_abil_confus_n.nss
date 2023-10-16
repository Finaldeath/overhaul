//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Confusion, Normal Int
//:: WW_Abil_Confus_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is a Bard,
    Sorcerer, or Wizard or is currently capable of
    casting Confusion through some other means.
    Normal Intelligence variant.
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
    int iSorcerer = GetLevelByClass(CLASS_TYPE_SORCERER, oPC);
    int iWizard = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int bHasConfuse = GetHasSpell(SPELL_CONFUSION, oPC);

    if (iBard > 0     ||
        iSorcerer > 0 ||
        iWizard > 0   ||
        bHasConfuse == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
