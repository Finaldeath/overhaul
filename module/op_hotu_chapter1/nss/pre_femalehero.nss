// checks to see if the PC is the hero and female

#include "inc_plot_locals"

int StartingConditional()
{
    int nSex = GetGender(GetPCSpeaker());
    if ((nSex == GENDER_FEMALE) && (IsPCHero(GetPCSpeaker())))
    {
        return TRUE;
    }
    return FALSE;
}
