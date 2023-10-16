#include "NW_I0_PLOT"
// * BRENT: Overwrote in an emergency fix for Chapter 3
int StartingConditional()
{
    int iResult;
    int nIQ =  GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE);
    if (nIQ > 14)
    {
        return TRUE;
    }
    return FALSE;
}
