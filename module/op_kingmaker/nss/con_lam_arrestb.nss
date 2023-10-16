//::///////////////////////////////////////////////
//:: Enivid Arrests Becket
//:: con_lam_arrestb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Enivid knows about the assassination attempt
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    int iArrest = GetLocalInt(GetModule(), "BECKET_ARRESTED");
    int iAssassin = GetLocalInt(oEnivid, "OS_ENIVID_ASSASSIN");
    int iResult;

    if ((iAssassin == 20) && (iArrest == FALSE))
    {
        iResult = TRUE;
    }

    return iResult;
}
