/// PC has spoken to Luce

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_G_M4Q01PLOTLEESA_RESCUE") ==1 ||
              CheckCharismaHigh();

    return iResult;
}


