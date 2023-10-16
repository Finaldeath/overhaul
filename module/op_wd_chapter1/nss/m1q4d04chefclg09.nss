#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = CheckIntelligenceNormal() &&
                     GetLocalInt(GetPCSpeaker(),"NW_L_M1Q4KnowPassword") == FALSE;
    return bCondition;
}
