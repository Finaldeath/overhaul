//::///////////////////////////////////////////////
//:: Already Voted
//:: con_lav_voted
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Lavos has already voted for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"OS_LAVOS_VOTE")==10;
    return iResult;
}
