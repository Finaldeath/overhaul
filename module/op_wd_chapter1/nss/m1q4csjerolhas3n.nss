#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition = CheckIntelligenceNormal() &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M1Q4JerolCoins") < 1 &&
                     HasGold(450,GetPCSpeaker());
    return bCondition;
}
