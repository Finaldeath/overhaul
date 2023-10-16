// Con_upcom2
//
// The battle in the room has begun

#include "inc_plot_locals"

int StartingConditional()
{
    //int nPlot = GetLocalInt(GetModule(), "DurnanSpoke");
    if (GetLocalInt(GetModule(), "X2_ypattack") > 0)
    {
        return TRUE;
    }
    return FALSE;
}

