#include "NW_I0_PLOT"
#include "m3plotinclude"
int StartingConditional()
{
    return CheckIntelligenceNormal()
        && PlayerHasEggs(GetPCSpeaker())
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q4HC_2EGGS")==0
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q4HC_1EGG")==0;
    ////////    Player has either Gorgotha's or Akulatraxas' dragon eggs (MPlAeGorgotha3Q4 or MPlAeAkulatra3Q4)
}
