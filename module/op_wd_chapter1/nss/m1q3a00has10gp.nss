#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = HasGold(10,GetPCSpeaker()) &&
                     GetLocalInt(OBJECT_SELF,"TOLD_MELDANEN") != 1 &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M1Q3AGoldGiven") == FALSE &&
                     CheckIntelligenceNormal() == TRUE;
    return bCondition;

}
