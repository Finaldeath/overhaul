#include "NW_I0_Plot"
int StartingConditional()
{
    object oHoff = GetLocalObject(GetModule(),"NW_G_M1S2Hoff");
	int bCondition =  GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Broach")) &&
                      ( !GetIsObjectValid(oHoff) ||
                        !GetIsDead(oHoff) ) &&
                      CheckIntelligenceLow();
	return bCondition;
}
