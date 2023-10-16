#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition = CheckIntelligenceNormal() &&
                GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IFIGHTPASS"));
    return bCondition;
}
