//::///////////////////////////////////////////////
//:: Beckett Affair
//:: con_ell_beckaffr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows about Beckett's affair
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(),"OS_BECKET_AFFAIR")>=10;
    return iResult;
}
