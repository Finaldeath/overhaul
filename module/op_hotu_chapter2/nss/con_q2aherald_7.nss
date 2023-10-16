//con_q2aherald_7
//if the PC has enlisted either the Deva or the golem's help in the battle,
//but has not yet placed them.
#include "x2_inc_globals"

int StartingConditional()
{
    if (GetGlobalInt("x2_plot_deva_help") == 1 && GetLocalInt(OBJECT_SELF, "nDevaPlaced") == 0)
        return TRUE;

    if ((GetGlobalInt("x2_plot_golem1_in") == 1 ||
        GetGlobalInt("x2_plot_golem2_in") == 1) && GetLocalInt(OBJECT_SELF, "nGolemsPlaced") == 0)
        return TRUE;

    return FALSE;
}
