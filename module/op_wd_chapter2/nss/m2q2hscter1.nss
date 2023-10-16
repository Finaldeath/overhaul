#include "nw_i0_plot"
#include "NW_J_RESCUE"
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID3") > 1)
    {
        return TRUE;
    }
    return FALSE;
}
