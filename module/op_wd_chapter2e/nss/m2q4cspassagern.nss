#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() &&
                (GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q04IKURTHRING")) ||
                GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q04IBARAMRING")));
	return l_iResult;
}
