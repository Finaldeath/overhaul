#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
int l_iResult;

l_iResult = CheckIntelligenceLow() &&
            GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 1
            && HasHeadOfSubCommand(GetPCSpeaker()) == TRUE
            && GetLocalInt(OBJECT_SELF,"NW_G_M3Q2A_ARNESSHEAD")==0;

///////  ALSO CHECK THAT PLAYER HAS ARNESS' HEAD (MPlAeArness'H3Q2)

return l_iResult;


}

