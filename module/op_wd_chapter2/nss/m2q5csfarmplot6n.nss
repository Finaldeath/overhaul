//::///////////////////////////////////////////////
//:: Dergiab Plot Incomplete
//:: M2Q5CSFARMPLOT6N
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dergiab Plot Incomplete, Normal IQ
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan. 22, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") < 20
    &&
    CheckIntelligenceNormal();
    return l_iResult;
}


