//::///////////////////////////////////////////////
//:: End Narration, Good Aribeth (Condition Script)
//:: H10c_End_Ari_G4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is good.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bEndBattle = GetLocalInt(GetModule(), "bAribethEndBattle");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);
    if (bEndBattle == TRUE &&
        iAlignment == ALIGNMENT_GOOD)
    {
        return TRUE;
    }
    return FALSE;
}
