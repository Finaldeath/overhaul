#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetObjectByTag("M1Q3_BossThug")) == FALSE &&
                     GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3ILoxarHead")) == FALSE &&
                     CheckIntelligenceLow();
    return bCondition;
}



