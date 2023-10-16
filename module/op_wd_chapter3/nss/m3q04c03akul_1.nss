//* Dragon 'takes' hill giant head
#include "M3PlotInclude"
#include "nw_i0_plot"

void main()
{
    TakeHillGiantChiefHead(GetPCSpeaker());
    RewardXP("M3Q04_C03_AKUL",100,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"AkulaPlotDone",1);
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q4EA_HILLGIANTHEAD",1);
}
