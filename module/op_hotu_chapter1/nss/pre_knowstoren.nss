// if the PC has been told about Durnan's supplies


#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(GetPCSpeaker(), "Know_Durnan_Store") == TRUE));
    return iResult;
}
