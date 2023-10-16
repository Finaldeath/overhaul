#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = CheckIntelligenceLow() &&
                     GetLocalInt(GetPCSpeaker(),"NW_L_M1Q4KnowPassword") == FALSE;
    return bCondition;
}
