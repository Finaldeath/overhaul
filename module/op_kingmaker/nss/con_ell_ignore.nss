//::///////////////////////////////////////////////
//:: Ellysia Ignores PC
//:: con_ell_withfera
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ellysia is ignoring the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(), "OS_ELLYSIA_MOOD")==99;
    return iResult;
}
