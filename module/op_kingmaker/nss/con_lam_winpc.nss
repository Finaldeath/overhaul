//::///////////////////////////////////////////////
//:: PC is Lord
//:: con_lam_winpc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has enough votes to be lord
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oEnivid = GetObjectByTag("q2_enivid");
    object oPC = GetFirstPC();
    int nEnivid = GetLocalInt(GetModule(), "OS_ENIVID_VOTES");
    int nPC = GetLocalInt(oPC,"OS_PC_VOTES");
    object oBecket = GetObjectByTag("q2_sirbecket");
    int nBecket = GetLocalInt(GetModule(), "OS_BECKET_VOTES");

    if ((nEnivid < nPC) && (nBecket < nPC))
    {
        iResult = TRUE;
    }

    return iResult;
}
