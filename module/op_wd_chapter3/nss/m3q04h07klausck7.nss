#include "NW_I0_PLOT"
#include "m3plotinclude"
int StartingConditional()
{
    return CheckIntelligenceLow() && PlayerHasEggs(GetPCSpeaker());
    ////////    Player has either Gorgotha's or Akulatraxas' dragon eggs (MPlAeGorgotha3Q4 or MPlAeAkulatra3Q4)
}

