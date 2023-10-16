//::///////////////////////////////////////////////
//:: Becket is tied with Enivid
//:: con_lam_tieenvbc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Becket is tied with Enivid.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Aug 2004
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

    if ((nPC < nBecket) && (nPC < nEnivid) && (nBecket == nEnivid))
    {
        iResult = TRUE;
    }

    return iResult;
}
