// PRE_DURNAN2NPC
//
// If the player does not have the Planar Stone
// and Durnan has given his first speech
// and the battle in the well room is over

#include "inc_plot_locals"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    if ((!IsPCHero(GetPCSpeaker())) && (nPlot == 2))
    {
        return TRUE;
    }
    return FALSE;
}
