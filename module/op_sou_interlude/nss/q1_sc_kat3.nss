// Katriana starting conditional: Player hasn't found Zidan yet.
#include "x1_inc_plot"

int StartingConditional()
{

    return GetPlot("Q1_JOURNAL_MISSING_GUIDE") >= 1;
}
