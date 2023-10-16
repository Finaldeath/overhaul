// Katriana starting conditional:  Talking to Katriana after hearing the story from Ali.

#include "x1_inc_plot"

int StartingConditional()
{
    if (GetPlot("Q2_JOURNAL_ROD") == 1 && GetLocalInt(GetModule(),"X1_KATMUMMY")==0)
        return TRUE;
    return FALSE;
}
