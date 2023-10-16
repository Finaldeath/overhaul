// If Nathyrra has not been talked to in Chapter 1

#include "x2_inc_globals"

int StartingConditional()
{
    int iResult;

    iResult = GetGlobalInt("XP2_NATHYRRA_TALKTO1") == 0;
    return iResult;
}
