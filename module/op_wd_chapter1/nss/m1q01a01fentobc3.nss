//// Check if PC has normal int and Note 3

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q1_LetterSpy"));;
    return iResult;
}


