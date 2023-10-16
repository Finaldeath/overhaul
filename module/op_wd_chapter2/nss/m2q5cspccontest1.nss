//the speaker has low INT and does not know about the contest

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5KnowContest");
    if (iPlot != 10)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
