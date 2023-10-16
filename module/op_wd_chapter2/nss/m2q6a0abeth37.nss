// player has high intelligence or is a cleric or paladin
#include "NW_I0_PLOT"

int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker());
    int Intelligence = GetAbilityScore(GetPCSpeaker(),ABILITY_INTELLIGENCE);
    if ((nClass > 0) || (Intelligence > 13))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
