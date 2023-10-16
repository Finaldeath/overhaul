//::///////////////////////////////////////////////
//:: Vote for PC
//:: con_ell_votepc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ellysia has already promised to vote for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(),"OS_NOBLE_GUILD")==10;
    return iResult;
}
