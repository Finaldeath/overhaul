#include "inc_module"

void main()
{
    object oPlayer;
    effect eRes, eHeal;
    int nHitsToHeal;

    oPlayer = GetLastRespawnButtonPresser();

    RemoveAllEffects(oPlayer);

    if ( GetIsDead(oPlayer) == TRUE )
    {
        eRes = EffectResurrection();
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eRes,oPlayer);
    }

    if ( GetCurrentHitPoints(oPlayer) < GetMaxHitPoints(oPlayer) )
    {
        nHitsToHeal = GetMaxHitPoints(oPlayer) - GetCurrentHitPoints(oPlayer);
        eHeal = EffectHeal(nHitsToHeal);
    }

    MovePlayerToStartLocation(oPlayer);
}
