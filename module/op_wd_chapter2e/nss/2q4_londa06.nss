// Londa has already told her story, job not accepted

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Londa_Job");
    if (iPlot == 1)
    {
        return TRUE;
    }
    return FALSE;
}
