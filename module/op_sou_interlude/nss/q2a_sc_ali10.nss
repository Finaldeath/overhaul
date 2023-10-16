// Starting conditional for Ali: talking to Ali atter destroying the mummy once and before destroying the rod
#include "x1_inc_plot"

int StartingConditional()
{
    return GetLocalInt(GetModule(), "Q2_SECOND_MUMMY_FIGHT") == 1 &&
            GetLocalInt(GetModule(), "Q2_ROD_DESTROYED") == 0;
}
