#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() && GetLocalInt(GetLastSpeaker(),"NW_G_M2Q4KnowBaby") == 10;
	return l_iResult;
}
