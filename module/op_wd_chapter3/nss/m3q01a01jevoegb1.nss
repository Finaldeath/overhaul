#include "nw_i0_plot"

void main()
{
    TakeGold(GetLocalInt(OBJECT_SELF,"NW_BRIBEAMOUNT"),GetPCSpeaker());
SetLocalInt(GetModule(), "NW_G_M1Q00PLOTBRIBEJUROR2",1);
AutoAlignE(DC_EASY, GetPCSpeaker());
SetLocalInt(GetPCSpeaker(),"JevonBribe",1);
}
