#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckCharismaHigh()  && GetLocalInt(GetModule(),"M2Q1JaxAtMercCamp") == 0;
	return l_iResult;
}
