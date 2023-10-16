//::///////////////////////////////////////////////
//:: End Narration, Good Aribeth Force Romance (Condition Script)
//:: H10c_End_Ari_G5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is good and the
     player's romantic interest. Romance forced
     by True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bEndBattle = GetLocalInt(GetModule(), "bAribethEndBattle");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");
    if (bEndBattle == TRUE &&
        iAlignment == ALIGNMENT_GOOD &&
        iRomance == 3)
    {
        return TRUE;
    }
    return FALSE;
}

