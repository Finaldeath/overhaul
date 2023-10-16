#include "NW_I0_Plot"
int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckCharismaLow() &&
                GetLocalInt(OBJECT_SELF,"L_TALKTIMES") < 1;
	return l_iResult;
}
