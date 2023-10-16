#include "help_general"

void main()
{
    object oRespawner = GetLastRespawnButtonPresser();

    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oRespawner);

    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oRespawner)), oRespawner);

    RemoveAllEffects(oRespawner);
}
