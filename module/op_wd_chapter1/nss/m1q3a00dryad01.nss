#include "NW_I0_PLOT"

int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker());
    int iSmart = GetAbilityScore(GetPCSpeaker(),ABILITY_WISDOM);
    if ((nClass>0) || (iSmart>13))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
