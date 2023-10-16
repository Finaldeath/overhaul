//::///////////////////////////////////////////////
//:: End Narration, Evil Aribeth Force Romance (Condition Script)
//:: H10c_End_Ari_E5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is evil and the
     player's romantic interest.
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
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");
    if (bEndBattle == TRUE &&
        iAlignment == ALIGNMENT_EVIL &&
        iRomance == 3)
    {
        return TRUE;
    }
    return FALSE;
}

