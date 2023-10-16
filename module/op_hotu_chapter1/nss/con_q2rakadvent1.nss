//::///////////////////////////////////////////////
//:: con_q2rakAdvent1
//:: //:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player has been warned against the
    Rakata by the dead adventurer
*/
//:://////////////////////////////////////////////
//:: Created By:  Drew Karpyshyn
//:: Created On:    June 26, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"RakshasaWarning")>0;


    return iResult;
}
