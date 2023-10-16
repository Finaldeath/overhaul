// PRE_DURNAN0NPC
//
// If the player does not have the Planar Stone
// and Durnan has not given his first speech

#include "inc_plot_locals"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    if ((!IsPCHero(GetPCSpeaker())) && (nPlot == 0))
    {
        return TRUE;
    }
    return FALSE;
}
