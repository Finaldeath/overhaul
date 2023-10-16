#include "NW_I0_Plot"
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M1Q1MainPlot") > 0 &&
                CheckIntelligenceLow();
	return l_iResult;
}
