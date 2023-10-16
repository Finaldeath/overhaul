//::///////////////////////////////////////////////
//:: Sleeping Man, Aribeth is Good (Condition Script)
//:: H3c_SMan_AriGood.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is Lawful Good.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetNearestObjectByTag("H2_Aribeth");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);

    if (iAlignment == ALIGNMENT_GOOD)
    {
        return TRUE;
    }
    return FALSE;
}
