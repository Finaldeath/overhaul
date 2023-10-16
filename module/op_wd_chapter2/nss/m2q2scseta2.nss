#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() && (GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITMIRRORVAN"))
             || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITNYMPHTEARS")));
	return l_iResult;
}
