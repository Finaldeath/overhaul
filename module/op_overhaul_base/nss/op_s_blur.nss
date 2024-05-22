//::///////////////////////////////////////////////
//:: Blur
//:: op_s_blur
//:://////////////////////////////////////////////
/*
    Caster Level(s): Bard 2, Wizard / Sorcerer 2
    Innate Level: 2
    School: Illusion
    Descriptor(s):
    Component(s): Verbal
    Range: Touch
    Area of Effect / Target: Single
    Duration: 1 minute / level
    Additional Counter Spells:
    Save: Harmless
    Spell Resistance: No

    The subject's outline appears blurred. This distortion grants the subject
    20% concealment.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eConcealment = EffectConcealment(20);
    effect eDur = EffectVisualEffect(VFX_DUR_BLUR);
    effect eCessate = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eLink = EffectLinkEffects(eConcealment, eDur);
    eLink = EffectLinkEffects(eLink, eCessate);

    float fDuration = GetDuration(nCasterLevel, MINUTES);

    SignalSpellCastAt();

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

