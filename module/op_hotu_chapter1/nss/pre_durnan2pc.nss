// PRE_DURNAN2PC
//
// If the player has the Planar Stone
// and Durnan has given his first speech
// and the battle in the well room is over

#include "inc_plot_locals"

int StartingConditional()
{
    //int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    if (GetLocalInt(GetModule(), "X2_ypattack") > 2)
    {
        return TRUE;
    }
    return FALSE;
}
