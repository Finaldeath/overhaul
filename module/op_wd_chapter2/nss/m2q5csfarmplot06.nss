//::///////////////////////////////////////////////
//:: Dergiab Plot Incomplete
//:: M2Q5CSFARMPLOT06
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dergiab Plot Incomplete, Low IQ
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan. 22, 2002
//:://////////////////////////////////////////////


#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") == 10
    &&
    CheckIntelligenceLow();
    return l_iResult;
}

