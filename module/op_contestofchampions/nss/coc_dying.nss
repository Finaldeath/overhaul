#include "inc_module"

void main()
{
    object oPlayer;
    effect eBleedToDeath;

    oPlayer = GetLastPlayerDying();

    if ( GetIsObserver(oPlayer) == FALSE )
    {
        eBleedToDeath = EffectHitPointChangeWhenDying(-1.0f);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eBleedToDeath,oPlayer);
    }
    else
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oPlayer);
    }
}
