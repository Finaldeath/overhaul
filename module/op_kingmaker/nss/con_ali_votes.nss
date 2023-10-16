//::///////////////////////////////////////////////
//:: Alias's Vote
//:: con_ali_votes
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This should occur when the PC gains another vote after the second.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_ALIAS_VOTE")==20;
    return iResult;
}
