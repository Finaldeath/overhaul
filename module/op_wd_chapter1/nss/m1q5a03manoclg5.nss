#include "NW_I0_PLOT"
int StartingConditional()
{
	int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") < 25 &&
                     CheckCharismaLow();
	return bCondition;
}
