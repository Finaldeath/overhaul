#include "nw_i0_plot"
#include "NW_J_RESCUE"
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_BreeFreed") == 0)
    {
        return TRUE;
    }
    return FALSE;
}
