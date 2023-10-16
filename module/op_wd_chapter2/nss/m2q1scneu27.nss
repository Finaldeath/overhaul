#include "NW_I0_PLOT"


// * Player has one of the rings, the journal or the tooth
int StartingConditional()
{
	int l_iResult;

	l_iResult =  CheckIntelligenceLow() &&
                (GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITRING01"))
                || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITRING02"))
                || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITRING03"))
                || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITKARJOURN"))
                || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITALHTOOTH")));
	return l_iResult;
}
