//::///////////////////////////////////////////////
//:: con_q2a_illhost
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if illithid are hostile
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: October 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0;
    return iResult;
}
