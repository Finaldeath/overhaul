#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = (CheckCharismaHigh() &&
                GetLocalInt(OBJECT_SELF,"NW_L_SmallTalk") > 8) ||
                (CheckCharismaNormal() &&
                GetLocalInt(OBJECT_SELF,"NW_L_SmallTalk") > 10) ||
                (CheckCharismaLow() &&
                GetLocalInt(OBJECT_SELF,"NW_L_SmallTalk") > 12);
	return l_iResult;
}
