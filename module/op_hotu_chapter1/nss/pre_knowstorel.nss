// if the PC has been told about Durnan's supplies
// and is of low intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(GetPCSpeaker(), "Know_Durnan_Store") == TRUE) &&
               (CheckIntelligenceLow()));
    return iResult;
}
