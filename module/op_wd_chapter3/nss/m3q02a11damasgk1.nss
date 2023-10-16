
#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
int l_iResult;

l_iResult = (CheckIntelligenceNormal() &&
            GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 0
            && GetLocalInt(GetModule(), "NW_G_M3Q02TALKFORTILKARDSIEGE") == M3Q2_SIEGEENGINESGONE);

///////  ALSO CHECK THAT ALL 6 CATAPULTS ARE DESTROYED (NW_G_M3Q02PLOTCATAPULTSDESTROYED at 6)

return l_iResult;


}
