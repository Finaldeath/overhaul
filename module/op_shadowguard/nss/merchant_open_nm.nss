#include "nw_i0_plot"

void main()
{
    object oMerchant = GetNearestObject(OBJECT_TYPE_STORE);

    gplotAppraiseOpenStore(oMerchant, GetPCSpeaker());
}
