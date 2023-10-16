//::///////////////////////////////////////////////
//:: Rafael Voted
//:: con_raf_voted
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rafael has already agreed to vote for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_RAFAEL_VOTE")==10;
    return iResult;
}
