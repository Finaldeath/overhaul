//::///////////////////////////////////////////////
//:: Leah alive and home
//:: M2Q5CSFARMPLOT01b
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Leah is alive and has been brought home, Low IQ
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan. 22, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_LEAHISDEAD")==0 &&
              GetLocalInt(GetModule(),"NW_G_LEAH_HOME")==10 &&
              CheckIntelligenceLow();
    return iResult;
}
