// Londa has not told her story, Charisma high

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Londa_Job");
    if (iPlot == 0)
    {
        return CheckCharismaHigh();
    }
    return FALSE;
}
