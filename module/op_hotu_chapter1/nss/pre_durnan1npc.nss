// PRE_DURNAN1NPC
//
// If the player does not have the Planar Stone
// and Durnan has not given his first speech

#include "inc_plot_locals"

int StartingConditional()
{
    object oStone = GetItemPossessedBy(GetPCSpeaker(), "x2_p_portal");
    int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    if ((!IsPCHero(GetPCSpeaker())) && (nPlot == 1))
    {
        return TRUE;
    }
    return FALSE;
}
