//::///////////////////////////////////////////////
//:: Name hx_arig_romance1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Romance with Good Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");

    if (iAlignment == ALIGNMENT_GOOD &&
        iRomance > 0)
    {
        return TRUE;
    }
    return FALSE;
}
