#include "NW_I0_Plot"
int StartingConditional()
{
    object oHoff = GetLocalObject(GetModule(),"NW_G_M1S2Hoff");
	int bCondition = GetLocalInt(oHoff,"NW_L_M1S2HoffScared") == TRUE &&
                     !GetIsDead(oHoff) &&
                     CheckIntelligenceLow();
	return bCondition;
}
