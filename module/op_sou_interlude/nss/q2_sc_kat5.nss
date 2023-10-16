// if the water plot has been completed

#include "x1_inc_plot"

int StartingConditional()
{
    int iResult;

    iResult = GetPlot("Q2_JOURNAL_WATER") == 100;
    return iResult;
}
