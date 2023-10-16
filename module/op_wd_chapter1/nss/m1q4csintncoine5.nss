#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() &&
                GetNumItems(GetPCSpeaker(),"M1Q04ISMUGCOIN") > 4;
    // This must be made to work
	return l_iResult;
}
