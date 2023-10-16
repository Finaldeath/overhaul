// should appear after the kobolds promised to help against the gnolls

#include "q3_inc_plot"

int StartingConditional()
{
    return GetPlot("Q3_JOURNAL_KOBOLD_PRISONERS") == 100;
}
