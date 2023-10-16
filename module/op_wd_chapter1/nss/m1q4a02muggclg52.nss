#include "NW_I0_plot"

int StartingConditional()

{
return CheckIntelligenceLow()&&
GetLocalInt(OBJECT_SELF,"NW_L_Dismissed");
}
