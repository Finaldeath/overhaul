#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                GetNumItems(GetPCSpeaker(),"M1Q04ISMUGCOIN") > 0 &&
                GetNumItems(GetPCSpeaker(),"M1Q04ISMUGCOIN") < 5;
    // This must be made to work
	return l_iResult;
}
