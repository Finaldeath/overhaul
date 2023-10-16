// if the draco-lich plot has been completed and there are
// now no undead in the Matron's army

#include "x2_inc_globals"

int StartingConditional()
{
    int iResult;

    iResult = GetGlobalInt("X2_Q2DDracolich") > 0;
    return iResult;
}

