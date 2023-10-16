// * Player Has Shaldrissa's Real Journal
#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() && GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITJOURNSHALR"));
	return l_iResult;
}
