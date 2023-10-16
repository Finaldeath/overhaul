#include "nw_i0_plot"

void main()
{
    object oStore = GetNearestObjectByTag("MT_HENCH_INV");
    gplotAppraiseOpenStore(oStore, GetPCSpeaker());
}
