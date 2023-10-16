//::///////////////////////////////////////////////
//:: Aribeth, Neutral Alignment, 2nd-Time-Talked-To (Condition Script)
//:: H2c_Ari_Neutral2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is still of Neutral
     alignment.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iAlignment = GetAlignmentGoodEvil(OBJECT_SELF);
    if (iAlignment == ALIGNMENT_NEUTRAL)
    {
        return TRUE;
    }
    return FALSE;
}
