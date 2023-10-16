//::///////////////////////////////////////////////
//:: con_q2rakleader002
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if SlavePlot is 20
     Player knows about portal and activation stone
     Third start condition
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: June 25, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"X2_Q2CSlavePlot")==20;
    return iResult;
}

