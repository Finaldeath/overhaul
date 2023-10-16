#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = AutoDC(DC_EASY,SKILL_LORE,GetPCSpeaker());
	return bCondition;
}
