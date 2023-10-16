#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"NW_ARTI_PLOT_TOLD");
    if ((iPlot == 0) && (GetLocalInt(GetModule(),"NW_ARTI_PLOT") == 0))
    {
        return CheckCharismaLow();
    }
    return FALSE;
}
