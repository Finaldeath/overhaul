#include "NW_I0_Plot"
int StartingConditional()
{
    object oSpeaker = GetPCSpeaker();
	int bCondition =  CheckIntelligenceNormal() &&
                      (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1Q2PlotReagent")) ||
                       GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1Q3PlotReagent")) ||
                       GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1Q4PlotReagent")) ||
                       GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1Q5PlotReagent")) ) ;
	return bCondition;
}
