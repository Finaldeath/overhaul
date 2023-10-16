// Londa's job has been accepted

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Londa_Job");
    if (iPlot == 2)
    {
        return TRUE;
    }
    return FALSE;
}
