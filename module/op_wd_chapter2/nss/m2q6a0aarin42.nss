#include "NW_I0_PLOT"

int StartingConditional()
{
    int iWisdom = GetAbilityScore(GetPCSpeaker(),ABILITY_WISDOM);
    if (iWisdom < 9)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
