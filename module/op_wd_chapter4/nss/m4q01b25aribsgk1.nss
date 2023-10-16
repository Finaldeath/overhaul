//////Check if PC has ring and is male and has normal int

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"ARIBETH_RING")) &&
              GetGender(GetPCSpeaker()) == GENDER_MALE &&
              CheckIntelligenceNormal();
    return iResult;
}
