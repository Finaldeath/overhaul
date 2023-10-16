/// Checks if War Golems still active and LOW int

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01_GOLEMS") < 2 &&
              CheckIntelligenceLow();
    return iResult;
}

