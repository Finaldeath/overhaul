#include "NW_I0_PLOT"

int StartingConditional()
{
	return CheckCharismaLow() && GetLocalInt(GetModule(),"M2Q1Night") == 1;
}

