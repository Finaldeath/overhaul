// Katriana starting conditional:
// talking to katriana after getting the water from Ali.

#include "x1_inc_plot"

int StartingConditional()
{
    return GetPlot("Q2_JOURNAL_WATER") == 50 || GetPlot("Q2_JOURNAL_ROD") == 80 || GetPlot("Q2_JOURNAL_ROD") == 30;
}
