// checks to see if the player has already gotten gold up front


#include "NW_I0_PLOT"
int StartingConditional()
{
    int nFront = GetLocalInt(GetPCSpeaker(), "Durnan_Front_Gold");
    if ((nFront == FALSE))
    {
        return TRUE;
    }
    return FALSE;
}
