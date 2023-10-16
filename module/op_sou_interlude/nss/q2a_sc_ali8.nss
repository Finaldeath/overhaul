// Starting conditional for Ali: The player did not talk to Katriana about the water.

#include "x1_inc_plot"

int StartingConditional()
{
    return GetPlot("Q2_JOURNAL_WATER") == 0;
}
