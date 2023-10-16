#include "NW_I0_PLOT"
// * Player has Stirge's Ear

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceNormal() &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISTIRGEEAR"));
    return l_iResult;
}
