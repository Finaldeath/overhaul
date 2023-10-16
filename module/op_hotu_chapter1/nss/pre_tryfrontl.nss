// checks to see if the player has already gotten gold up front
// and if his intelligence is low

#include "NW_I0_PLOT"
int StartingConditional()
{
    int nFront = GetLocalInt(GetPCSpeaker(), "Durnan_Front_Gold");
    if ((nFront == FALSE) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
