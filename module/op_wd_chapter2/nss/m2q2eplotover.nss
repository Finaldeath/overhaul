#include "m2_i0_plot"

void main()
{
    SetPartyLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT",99);
    SetLocalInt(OBJECT_SELF, "NW_M2Q2E_LFINDSPIRIT",99);
    SetLocalInt(OBJECT_SELF,"NW_L_SpiritReward",1);
}
