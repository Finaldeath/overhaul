// * Player Has Zor's Ear
#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceLow() &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q05IZOREAR"));
    return l_iResult;
}
