#include "nw_i0_plot"

int StartingConditional()
{
    return GetAbilityScore(GetPCSpeaker(),ABILITY_STRENGTH) > 15;
}
