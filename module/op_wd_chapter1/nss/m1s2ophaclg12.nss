#include "NW_I0_Plot"
int StartingConditional()
{
    object oSpeaker = GetPCSpeaker();
	int bCondition = GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S2Letter2")) &&
                     !GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S2Key1")) &&
                     CheckIntelligenceNormal();
	return bCondition;
}
