#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetGender(GetPCSpeaker()) == GENDER_FEMALE;
    return iResult;
}
