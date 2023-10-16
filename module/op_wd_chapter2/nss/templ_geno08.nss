#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult = GetLocalInt(GetPCSpeaker(),"GENOCIDEGEN1_TALK");
    int iPlot = GetLocalInt(GetModule(),"NW_GENO_PLOT");
    if ((iResult == 2) && (iPlot == 0))
    {
        return TRUE;
    }
    return FALSE;
}
