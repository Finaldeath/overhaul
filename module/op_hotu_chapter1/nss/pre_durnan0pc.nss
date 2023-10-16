// PRE_DURNAN0PC
//
// If the player has the Planar Stone
// and Durnan has not given his first speech

#include "inc_plot_locals"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    object oPC = GetPCSpeaker();
    if ((IsPCHero(oPC) && (nPlot == 0)) || GetLocalInt(GetModule(), "nYPAttackDone") == 0)
    {
        return TRUE;
    }
    return FALSE;
}
