// if the PC is at less than 100% HP
// or suffering from a negative effect
// and his Intelligence is normal

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nHP = GetCurrentHitPoints(GetPCSpeaker());
    int nMaxHP = GetMaxHitPoints(GetPCSpeaker());
    if ((nHP < nMaxHP) && (CheckIntelligenceNormal()))
    {
        return TRUE;
    }
    else
    {
        effect eState = GetFirstEffect(GetPCSpeaker());
        while (GetIsEffectValid(eState))
        {
            if (((GetEffectType(eState) == EFFECT_TYPE_ABILITY_DECREASE)||
                (GetEffectType(eState) == EFFECT_TYPE_BLINDNESS) ||
                (GetEffectType(eState) == EFFECT_TYPE_DEAF) ||
                (GetEffectType(eState) == EFFECT_TYPE_DISEASE) ||
                (GetEffectType(eState) == EFFECT_TYPE_NEGATIVELEVEL) ||
                (GetEffectType(eState) == EFFECT_TYPE_POISON)) &&
                (CheckIntelligenceNormal()))
            {
                return TRUE;
            }
            else eState = GetNextEffect(GetPCSpeaker());
        }
    }
    return FALSE;
}
