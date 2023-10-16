//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Deva: Paladin (Condition Script)
//:: Q3c_Deva_Persuad.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is an active
     paladin.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bPaladin = GetLevelByClass(CLASS_TYPE_PALADIN, oPC);
    int iGood = GetAlignmentGoodEvil(oPC);
    int iLawful = GetAlignmentLawChaos(oPC);
    if (bPaladin == TRUE &&
        iGood == ALIGNMENT_GOOD &&
        iLawful == ALIGNMENT_LAWFUL)
    {
        return TRUE;
    }
    return FALSE;
}
