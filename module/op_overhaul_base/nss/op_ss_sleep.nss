//:://////////////////////////////////////////////
//:: Sleep State Script
//:: op_ss_sleep
//:://////////////////////////////////////////////
/*
    This heartbeat script fires when EffectSleep is the highest priority
    state applied to a creature.

    We do a random Zzz :)
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

void main()
{
    // Shows we're sleeping randomly. Hopefully no module is using this in cutscenes.
    if (d4() == 1)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), OBJECT_SELF);
    }
}
