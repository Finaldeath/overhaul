#include "NW_I0_PLOT"

// * Player has Tome of Imaskar
int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() && GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITIMASKAR"));
	return l_iResult;
}
