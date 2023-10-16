// PRE_DURNAN1PC
//
// If the player has the Planar Stone
// and Durnan has given his first speech

//and the attack cutscene has run (check this to catch any save/load issues

#include "inc_plot_locals"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    object oPC = GetPCSpeaker();
    if (IsPCHero(oPC) && (nPlot == 1) && GetLocalInt(GetModule(), "nYPAttackDone") == 1)
    {
        return TRUE;
    }
    return FALSE;
}
