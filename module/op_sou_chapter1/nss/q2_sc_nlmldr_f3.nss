// check if destroyed spider sacs not destroyed AND did not talk to Nilmaldor

#include "q2_inc_plot"

int StartingConditional()
{
    if (GetPlot("Q2_SPIDERS") < 10 && GetLocalInt(GetPCSpeaker(), "Q2_TALKED_TO_NILMALDOR") != 1)
        return TRUE;
    return FALSE;
}
