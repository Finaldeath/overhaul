#include "NW_I0_PLOT"

int StartingConditional()
{
	return CheckCharismaHigh() && GetLocalInt(GetModule(),"M2Q1Night") == 0;
}
