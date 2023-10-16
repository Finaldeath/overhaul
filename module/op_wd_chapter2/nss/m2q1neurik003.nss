#include "m2_i0_plot"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT",1);
    if (GetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") < 80)
    {
        SetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT",80);
    }
}
