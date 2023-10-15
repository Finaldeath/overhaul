#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = CheckIntelligenceNormal() &&
                     (GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") == 0 ||

                      (GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") == 1 &&

                      (GetLocalInt(GetModule(),"NW_G_M0Q01_NONFIGHTER_PASS") == FALSE ||
                       GetLocalInt(GetModule(),"NW_G_M0Q01_NONFIGHTER_PASS2") == FALSE  )));
    return bCondition;
}


