// if the player is male & has a high Charisma

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iSex = GetGender(GetPCSpeaker());
    if ((iSex == GENDER_MALE) && CheckCharismaHigh())
    {
        return TRUE;
    }
    return FALSE;
}
