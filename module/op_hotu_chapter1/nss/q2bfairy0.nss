//::///////////////////////////////////////////////
//:: q2bfairy0
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if Fairy Queen status is not at 0
    (Defeated or dead)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"FairyQueen")>0;
    return iResult;
}

