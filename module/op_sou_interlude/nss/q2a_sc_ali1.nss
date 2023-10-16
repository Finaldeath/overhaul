// Starting conditional for Ali: Talking to Ali after getting the water.

#include "x1_inc_plot"

int StartingConditional()
{
    return GetPlot("Q2_JOURNAL_WATER") == 50;
}
