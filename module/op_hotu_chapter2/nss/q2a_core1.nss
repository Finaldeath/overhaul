//::///////////////////////////////////////////////
//:: q2a_core1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if main plot variable is at 1 or greater
    ("X2_Chapter2Plots_Done")
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: October 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"X2_Chapter2Plots_Done")>=1;
    return iResult;
}
