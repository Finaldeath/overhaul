//::///////////////////////////////////////////////
//:: q2bfairy20
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if Fairy Queen status is at 20
    (FairyQueenDead)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"FairyQueen")==20;
    return iResult;
}
