//::///////////////////////////////////////////////
//:: q2bfairy10
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if Fairy Queen status is at 10
    (Defeated but not dead)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"FairyQueen")==10;
    return iResult;
}
