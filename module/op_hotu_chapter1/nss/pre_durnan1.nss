// PRE_DURNAN1
//
// If Durnan has given his first speech
// and the battle in the well room is over

#include "inc_plot_locals"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    if (nPlot == 1)
    {
        return TRUE;
    }
    return FALSE;
}

