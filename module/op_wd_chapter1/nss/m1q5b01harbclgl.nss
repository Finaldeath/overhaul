#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF,"NW_L_M1Q5BHarb_Reward") == FALSE &&
                     CheckIntelligenceNormal();
    return bCondition;
}
