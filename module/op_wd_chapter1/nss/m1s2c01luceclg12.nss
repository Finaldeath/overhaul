#include "NW_I0_Plot"
int StartingConditional()
{
    int nSmallTalk = GetLocalInt(OBJECT_SELF,"NW_L_M1S2SmallTalk");
    int bCondition = (CheckCharismaHigh() && nSmallTalk > 6) ||
                     (CheckCharismaMiddle() && nSmallTalk > 8) ||
                     (CheckCharismaLow() && nSmallTalk > 10);
    return bCondition;
}
