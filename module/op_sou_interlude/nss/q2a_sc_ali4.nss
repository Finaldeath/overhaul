// Starting conditional for Ali: Tallking to Ali for the first time, after retrieving the rod.

#include "x1_inc_plot"

int StartingConditional()
{
    return GetLocalInt(GetPCSpeaker(), "Q2_TALKED_TO_ALI") == 0 && GetPlot("Q2_JOURNAL_ROD") >= 10;
}
