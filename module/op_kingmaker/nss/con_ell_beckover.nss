//::///////////////////////////////////////////////
//:: Beckett over
//:: con_ell_beckover
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Ellysia is finished with Beckett
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(),"OS_BECKET_AFFAIR")==20;
    return iResult;
}
