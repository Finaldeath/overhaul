#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckCharismaMiddle() &&
                GetLocalInt(GetModule(),"NW_G_M2Q5LeahRescue") == 0;
	return l_iResult;
}
