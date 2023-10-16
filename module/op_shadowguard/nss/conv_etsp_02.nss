#include "nw_i0_plot"

void main()
{
    object oStore = GetNearestObjectByTag("MT_BEG_STORE");

    gplotAppraiseOpenStore(oStore, GetPCSpeaker());
}
