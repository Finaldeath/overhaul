//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     check if Becka is free and happy
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 6, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X1_Q1RuralRebFree")== 70
                || GetLocalInt(GetModule(), "X1_Q1RuralRebFree")== 99;
    return iResult;
}
