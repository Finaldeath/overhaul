// Player has agreed to work for Kurth

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() && (GetLocalInt(GetPCSpeaker(),"Working_For_Kurth") == 1);
    return iResult;
}
