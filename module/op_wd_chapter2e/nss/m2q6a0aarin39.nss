#include "NW_I0_PLOT"

int StartingConditional()
{
    int iWisdom = GetAbilityScore(GetPCSpeaker(),ABILITY_WISDOM);
    if (iWisdom > 13)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
