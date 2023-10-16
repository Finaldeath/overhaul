#include "nw_i0_plot"

void main()
{
    AutoAlignG(DC_MEDIUM, GetPCSpeaker());
    TakeGold(100,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"NW_L_GaveGPTo" + GetTag(OBJECT_SELF),TRUE);
}
