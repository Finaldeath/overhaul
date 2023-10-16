// Player hasn't found Zidan yet, 33% chance of returning true

#include "x1_inc_plot"

int StartingConditional()
{
    int nPlot = GetPlot("Q1_JOURNAL_MISSING_GUIDE");
    if ((nPlot == 1) && (d100() < 34))
    {
        return TRUE;
    }
    return FALSE;
}
