// dracolich phylactery destroyed - dracolich won't respawn again

#include "nw_i0_plot"

void main()
{
    object oPC = GetLastKiller();
    Reward_2daXP(oPC, 27);
    effect eVis = EffectVisualEffect(VFX_FNF_IMPLOSION);
    effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oPC);

    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(103));
}
