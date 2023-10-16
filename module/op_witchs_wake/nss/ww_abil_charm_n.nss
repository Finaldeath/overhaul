//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Charm Person, Normal Int
//:: WW_Abil_Charm_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is a Bard, Druid,
    Sorcerer, or Wizard or is currently capable of
    casting Charm Person (or Animal) through some
    other means. Normal Intelligence variant.
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
    int iDruid = GetLevelByClass(CLASS_TYPE_DRUID, oPC);
    int iSorcerer = GetLevelByClass(CLASS_TYPE_SORCERER, oPC);
    int iWizard = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int bHasCharm = GetHasSpell(SPELL_CHARM_PERSON, oPC);
    int bHasCharm2 = GetHasSpell(SPELL_CHARM_PERSON_OR_ANIMAL, oPC);

    if (iBard > 0         ||
        iDruid > 0        ||
        iSorcerer > 0     ||
        iWizard > 0       ||
        bHasCharm == TRUE ||
        bHasCharm2 == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
