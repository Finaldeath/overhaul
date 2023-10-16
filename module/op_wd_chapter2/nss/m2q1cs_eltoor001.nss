//::///////////////////////////////////////////////
//:: M2Q1cs_Eltoor001
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC can only ask for work if the tomes have
    not been found.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetModule(),"NW_G_FoundImaskTome") < 5;
    return iResult;
}
