//::///////////////////////////////////////////////
//:: Witchwork 1: FireStatue, Arcane Magic-User Condition
//:: WW1_FireStat_MU.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE is the player is of an arcane
     spell-casting class.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iBard = GetLevelByClass(CLASS_TYPE_BARD, oPC);
    int iWizard = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int iSorcerer = GetLevelByClass(CLASS_TYPE_SORCERER, oPC);

    if (iBard > 0 ||
        iWizard > 0 ||
        iSorcerer > 0)
    {
        return TRUE;
    }
    return FALSE;
}
