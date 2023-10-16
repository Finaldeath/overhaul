#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"NW_CONS_PLOT_TOLD");
    if ((iPlot == 0) && (GetLocalInt(GetModule(),"NW_CONS_PLOT") == 0))
    {
        return CheckCharismaMiddle();
    }
    return FALSE;
}
