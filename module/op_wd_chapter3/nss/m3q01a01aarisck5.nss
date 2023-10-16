///////Check if player has advanced romance and normal int

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult =  CheckIntelligenceNormal() &&
               GetLocalInt(GetPCSpeaker(),"GENDROMANCE") == 1;

    return iResult;
}


