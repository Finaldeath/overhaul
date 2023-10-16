// if the beholder plot has been completed, and there are
// now no beholders in the matron's army

#include "x2_inc_globals"

int StartingConditional()
{
    int iResult;

    iResult = GetGlobalInt("x2_plot_beholders_out") == 1;
    return iResult;
}
