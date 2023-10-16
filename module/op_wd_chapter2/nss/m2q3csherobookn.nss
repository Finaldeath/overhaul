#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() && !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q3ITJOURNHERO"));
    return iResult;
}
