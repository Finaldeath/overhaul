//con_q2aherald_8
//if the PC has enlisted  the Deva's help in the battle,
//but has not yet placed her.
#include "x2_inc_globals"

int StartingConditional()
{
    if (GetGlobalInt("x2_plot_deva_help") == 1 && GetLocalInt(OBJECT_SELF, "nDevaPlaced") == 0)
        return TRUE;


    return FALSE;
}
