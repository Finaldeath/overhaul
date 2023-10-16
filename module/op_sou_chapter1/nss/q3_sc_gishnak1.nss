// starting conditional for when J'Nah is dead

#include "q3_inc_plot"

int StartingConditional()
{

    return GetLocalInt(GetModule(), "X1_JNAH_STATUS") == 3;
}
