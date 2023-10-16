//::///////////////////////////////////////////////
//:: Witchwork 1: Chaotic Condition
//:: WW1_Chaotic_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE 100% of the time if the player
     is Chaotic and 50% of the time if she is
     Neutral.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iAlignment = GetAlignmentLawChaos(oPC);
    int iPercent = Random(100)+1;

    if (iAlignment == ALIGNMENT_CHAOTIC ||
        (iAlignment == ALIGNMENT_NEUTRAL &&
         iPercent > 50))
    {
        return TRUE;
    }
    return FALSE;
}
