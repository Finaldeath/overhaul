//::///////////////////////////////////////////////
//:: con_q2rakleader001
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if SlavePlot Int on the Rakshasa leader is 10
     Player knows they are slaves, hasn't heard about portal or stone yet

*/

//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: June 25, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"X2_Q2CSlavePlot")==10;
    return iResult;
}
