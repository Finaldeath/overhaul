#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Letter2")) &&
                     CheckIntelligenceLow();
	return bCondition;
}
