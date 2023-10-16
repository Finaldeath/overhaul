#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
int l_iResult;

l_iResult = CheckIntelligenceNormal() /*&&
            GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") < 3*/
            && HasPlagueBlankets(GetPCSpeaker());

///////  ALSO CHECK THAT PLAYER HAS Uthgardt Plague blankets

return l_iResult;


}

