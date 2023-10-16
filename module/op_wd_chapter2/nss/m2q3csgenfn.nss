#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetGender(GetPCSpeaker()) == GENDER_FEMALE;
    return iResult;
}
