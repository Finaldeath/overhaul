//::///////////////////////////////////////////////
//:: The Knower of Names, Aribeth is Good (Condition Script)
//:: H7c_Name_Ari_6.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is good.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bAlignment = GetAlignmentGoodEvil(oAribeth);
    if (bAlignment == ALIGNMENT_GOOD)
    {
        return TRUE;
    }
    return FALSE;
}
