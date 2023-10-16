//// Check if PC has low int and Note 3

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q1_LetterSpy"));;
    return iResult;
}



