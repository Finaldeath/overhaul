//::///////////////////////////////////////////////
//:: Sleeping Man, Aribeth is Evil (Condition Script)
//:: H3c_SMan_AriEvil.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is Chaotic Evil.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetNearestObjectByTag("H2_Aribeth");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);

    if (iAlignment == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}

