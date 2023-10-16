// Katriana starting conditional:
// Talking to Katriana after getting the rod, but BEFORE talking to Ali and getting the water.

#include "x1_inc_plot"

int StartingConditional()
{
    return GetPlot("Q2_JOURNAL_ROD") == 100 && GetPlot("Q2_JOURNAL_WATER") < 50;
}
