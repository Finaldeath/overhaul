//::///////////////////////////////////////////////
//:: First Vote
//:: con_ali_firstvot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias comes to tell you about the first vote
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_ALIAS_VOTE")==10;
    return iResult;
}
