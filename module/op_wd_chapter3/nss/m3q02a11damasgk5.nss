#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
int l_iResult;

l_iResult = CheckIntelligenceNormal()
           // && GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 2
           && GetLocalInt(GetPCSpeaker(),"Zokan") ==1
            && HasHeadOfCommand(GetPCSpeaker())
            && GetLocalInt(OBJECT_SELF,"NW_G_M3Q2A_ZOKANHEAD")==0;

///////  ALSO CHECK THAT PLAYER HAS Zokan's HEAD (MPlAeZokan'sh3Q2)

return l_iResult;


}

