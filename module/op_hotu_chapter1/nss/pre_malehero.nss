// checks to see if the PC is the hero and male

#include "inc_plot_locals"

int StartingConditional()
{
    int nSex = GetGender(GetPCSpeaker());
    if ((nSex == GENDER_MALE) && (IsPCHero(GetPCSpeaker())))
    {
        return TRUE;
    }
    return FALSE;
}
