#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition = CheckIntelligenceNormal() &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M1Q4JerolCoins") < 3 &&
                     HasGold(150,GetPCSpeaker());
    return bCondition;
}
