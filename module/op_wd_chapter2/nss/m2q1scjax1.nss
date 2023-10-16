#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckCharismaLow()  && GetLocalInt(GetModule(),"M2Q1JaxAtMercCamp") == 0;
	return l_iResult;
}
