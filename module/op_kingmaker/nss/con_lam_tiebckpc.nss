//::///////////////////////////////////////////////
//:: PC is tied with Becket
//:: con_lam_tiebckpc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is tied with Becket.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult = FALSE;

    object oEnivid = GetObjectByTag("q2_enivid");
    int nEnivid = GetLocalInt(GetModule(), "OS_ENIVID_VOTES");

    object oPC = GetFirstPC();
    int nPC = GetLocalInt(oPC,"OS_PC_VOTES");

    object oBecket = GetObjectByTag("q2_sirbecket");
    int nBecket = GetLocalInt(GetModule(), "OS_BECKET_VOTES");

    if ((nEnivid < nPC) && (nEnivid < nBecket) && (nPC == nBecket))
    {
        iResult = TRUE;
    }

    return iResult;
}
