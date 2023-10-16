#include "NW_I0_PLOT"

int StartingConditional()
{
	return CheckIntelligenceNormal() && GetLocalInt(GetModule(),"M2Q2DruidsFreed") == 0 &&
        (GetLocalInt(GetModule(),"M2Q2TerariIsFree") == 1 || GetLocalInt(GetModule(),"M2Q2OrlaneIsFree") == 1
         || GetLocalInt(GetModule(),"M2Q2BreeIsFree") == 1);

 ;
}
