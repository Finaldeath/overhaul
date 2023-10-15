#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = CheckIntelligenceLow() &&
                     (GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") < 2 ||

                      (GetLocalInt(GetModule(),"NW_G_M0Q01_NONFIGHTER_PASS") &&
                       GetLocalInt(GetModule(),"NW_G_M0Q01_NONFIGHTER_PASS2") &&
                        GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") == 1));
    return bCondition;
}

