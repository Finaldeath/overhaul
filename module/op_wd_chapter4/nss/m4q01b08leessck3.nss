/// PC has spoken to Luce and is low int

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetLocalInt(GetPCSpeaker(), "NW_G_M4Q01PLOTLEESA_RESCUE") ==1;
    return iResult;
}

