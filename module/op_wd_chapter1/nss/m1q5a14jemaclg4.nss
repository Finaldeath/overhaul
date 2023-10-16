#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q5Signet1")) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_RewardGiven") == FALSE &&
                     CheckIntelligenceNormal();
    return bCondition;
}
