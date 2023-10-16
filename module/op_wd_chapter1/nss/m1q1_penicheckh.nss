//:://////////////////////////////////////////////
/*
    Check if the character has a normal intelligence
    Check if Peninsula plot is done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: Mar 01, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition = CheckIntelligenceNormal() &&
        GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot") == 100;
    return bCondition;
}

