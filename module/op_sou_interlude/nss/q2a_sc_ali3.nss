// Starting conditional for Ali: player did not hear the story and does not know about the rod.
#include "x1_inc_plot"

int StartingConditional()
{
    return GetPlot("Q2_JOURNAL_ROD") == 0;
}
