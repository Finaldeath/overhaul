// if the PC is the hero and Durnan has not been told about the dream

#include "inc_plot_locals"

int StartingConditional()
{
    int nDream = GetLocalInt(OBJECT_SELF, "Durnan_Told_Dream");
    if ((nDream == 0) && (IsPCHero(GetPCSpeaker())))
    {
        return TRUE;
    }
    return FALSE;
}
