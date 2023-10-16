#include "NW_I0_plot"
int StartingConditional()
{
	int bCondition = GetLocalInt(OBJECT_SELF,"NW_L_M1S2SmallTalk") > 5 &&
                     CheckIntelligenceLow();
	return bCondition;
}
