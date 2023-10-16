#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF,"NW_L_M1Q3Friendly") == FALSE &&
                      CheckCharismaMiddle();
    return bCondition;
}
