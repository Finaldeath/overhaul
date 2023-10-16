//::///////////////////////////////////////////////
//:: Aribeth, Neutral Alignment, 1st-Time-Talked-To (Condition Script)
//:: H2c_Ari_Neutral1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is still of Neutral
     alignment and this line has not been spoken
     before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iAlignment = GetAlignmentGoodEvil(OBJECT_SELF);
    int bDoOnce = GetLocalInt(GetModule(), "bNeutralDoOnce");
    if (iAlignment == ALIGNMENT_NEUTRAL &&
        bDoOnce == FALSE)
    {
        SetLocalInt(GetModule(), "bNeutralDoOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}
