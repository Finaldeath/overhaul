//::///////////////////////////////////////////////
//:: Aribeth, Generic Evil Check (Condition Script)
//:: H2c_Ari_Evil.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A generic script that returns TRUE if
     Aribeth is Evil-aligned. Used for her
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
    if (iAlignment == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
