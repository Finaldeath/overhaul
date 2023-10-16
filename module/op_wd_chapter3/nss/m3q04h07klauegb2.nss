// * Takes eggs from player, gives 5000 gp (this is for additioanl eggs brought back
#include "m3plotinclude"
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "NW_G_M3Q04PLOTKLAUTH", 99);
    SetLocalObject(OBJECT_SELF, "M3Q04CKLAUTHPLOT", GetPCSpeaker());
    ////  Take eggs away, give player Word of Power
    RewardGP(5000, GetPCSpeaker());
    TakeEggs(GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q4HC_2EGGS",1);
}

