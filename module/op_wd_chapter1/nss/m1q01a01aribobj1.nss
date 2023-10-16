//// Check if PC has normal int and one of Fenthick's notes

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q1_LetterConspiracy")) ||
               GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q1_LetterCult")) ||
               GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q1_LetterSpy")));
    return iResult;
}

