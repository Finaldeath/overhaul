// checks to see if the PC has a High Wisdom and Low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceLow() && CheckWisdomHigh();
    return l_iResult;
}
