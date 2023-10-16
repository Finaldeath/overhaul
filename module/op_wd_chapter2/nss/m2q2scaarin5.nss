#include "NW_I0_PLOT"

int StartingConditional()
{
	return CheckCharismaMiddle() && GetLocalInt(GetModule(),"M2Q1Night") == 1;
}
