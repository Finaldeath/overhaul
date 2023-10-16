// PRE_DURNAN3PC
//
// If the player has the Planar Stone
// and Durnan has given his first speech
// and the battle in the well room is over
// and the beholder cut-scene has played

#include "inc_plot_locals"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    if ((IsPCHero(GetPCSpeaker())) && (nPlot == 3))
    {
        return TRUE;
    }
    return FALSE;
}
