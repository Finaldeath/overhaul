//::///////////////////////////////////////////////
//:: End Narration, Evil Aribeth (Condition Script)
//:: H10c_End_Ari_E4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is evil.
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
        iAlignment == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
