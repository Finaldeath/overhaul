// Player has agreed to work for Baram

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() && (GetLocalInt(GetPCSpeaker(),"Working_For_Baram") == 1);
    return iResult;
}
