#include "NW_I0_PLOT"

int StartingConditional()
{
    int iGender = GetGender(GetPCSpeaker());
    if ((iGender == GENDER_MALE)&& CheckIntelligenceNormal())
    {
        return TRUE;
    }
    return FALSE;
}
