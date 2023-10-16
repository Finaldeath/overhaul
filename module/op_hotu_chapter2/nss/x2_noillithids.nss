// if the illithid plot has been completed and there are
// now no illithids in the Matron's army

#include "x2_inc_globals"

int StartingConditional()
{
    if (GetGlobalInt("X2_Q2DOvermind") == 2)
        return TRUE;
    return FALSE;
}
