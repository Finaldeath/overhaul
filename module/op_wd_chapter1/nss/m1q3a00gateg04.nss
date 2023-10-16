#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition =  GetRacialType(GetPCSpeaker()) == GetRacialType(OBJECT_SELF) &&
                      HasGold(100,GetPCSpeaker()) &&
                      CheckIntelligenceLow();
    return bCondition;
}
