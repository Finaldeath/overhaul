// if the PC is the hero and Durnan has not been told about the dream
// and is of low intelligence

#include "inc_plot_locals"
#include "NW_I0_PLOT"

int StartingConditional()
{
    int nDream = GetLocalInt(OBJECT_SELF, "Durnan_Told_Dream");
    if ((nDream == 0) && (IsPCHero(GetPCSpeaker())) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
