//::///////////////////////////////////////////////
//:: Witchwork 1: FireStatue, Not an Arcane Magic-User
//:: WW1_FireStat_XMU.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE is the player is NOT of an arcane
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

    if (iBard == 0 &&
        iWizard == 0 &&
        iSorcerer == 0)
    {
        return TRUE;
    }
    return FALSE;
}
