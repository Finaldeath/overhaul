//* Jax notices a player in the woods
#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1JaxAtMercCamp") == 1 &&  GetLocalInt(GetModule(),"M2Q1JaxInitMercCamp") == 1;
	return l_iResult;
}
