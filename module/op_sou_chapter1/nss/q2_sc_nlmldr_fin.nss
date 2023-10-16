// check if destroyed spider sacs AND talked to Nilmaldor

#include "q2_inc_plot"

int StartingConditional()
{
    return (GetPlot("Q2_SPIDERS") > 10
        && GetLocalInt(GetPCSpeaker(), "Q2_TALKED_TO_NILMALDOR") == 1);
}
