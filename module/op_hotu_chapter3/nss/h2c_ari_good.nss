//::///////////////////////////////////////////////
//:: Aribeth, Generic Good Check (Condition Script)
//:: H2c_Ari_Good.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A generic script that returns TRUE if
     Aribeth is Good-aligned. Used for her
     interjections
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);
    if (iAlignment == ALIGNMENT_GOOD)
    {
        return TRUE;
    }
    return FALSE;
}
