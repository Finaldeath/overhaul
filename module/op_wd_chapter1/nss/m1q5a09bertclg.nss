#include "NW_I0_Plot"
int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckCharismaHigh() &&
                GetLocalInt(OBJECT_SELF,"L_TALKTIMES") < 1;
	return l_iResult;
}
