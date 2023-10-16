#include "NW_I0_PLOT"

int StartingConditional()
{

    int iGender = GetGender(GetPCSpeaker());
    if ((iGender == GENDER_MALE)&& CheckIntelligenceLow())
    {
        return TRUE;
    }
    return FALSE;
}

