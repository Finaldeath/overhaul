#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00MELDKEY")) &&
                      GetLocalInt(OBJECT_SELF,"KEY_RECEIVED") == FALSE &&
                     CheckIntelligenceLow();
    return bCondition;
}
