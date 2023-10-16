//::///////////////////////////////////////////////
//:: Beckett is loyal
//:: con_bec_loyal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Beckett is loyal
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oMod = GetModule();

    iResult = GetLocalInt(oMod, "OS_PC_LORD")==50
        || GetLocalInt(GetModule(), "OS_BECKET_BANNER")==10;
    return iResult;
}
