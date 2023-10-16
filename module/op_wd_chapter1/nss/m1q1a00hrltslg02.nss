#include "nw_i0_plot"

void main()
{
    TakeGold(1,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"NW_L_GaveGPTo" + GetTag(OBJECT_SELF),TRUE);
}

