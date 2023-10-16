// PRE_DURNAN0PC2
//
// If the player has the Planar Stone
// and Durnan has not given his first speech
// and the adventuring party has already been spoken to

#include "inc_plot_locals"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    int nPlot2 = GetLocalInt(GetModule(), "PRE_SPOKE_ADVENTURERS");
    if ((IsPCHero(GetPCSpeaker())) && (nPlot == 0) && (nPlot2 == 1))
    {
        return TRUE;
    }
    return FALSE;
}
