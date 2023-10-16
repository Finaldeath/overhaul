#include "NW_I0_plot"
int StartingConditional()
{
	int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Pass")) &&
                     CheckIntelligenceNormal();
	return bCondition;
}
