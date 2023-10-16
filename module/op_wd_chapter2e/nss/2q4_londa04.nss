// Londa has not told her story, Charisma medium

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Londa_Job");
    if (iPlot == 0)
    {
        return CheckCharismaMiddle();
    }
    return FALSE;
}
