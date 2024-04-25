//::///////////////////////////////////////////////
//:: Minor Globe of Invulnerability
//:: op_s_minorglobe.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard/Sorcerer 4
    Innate Level: 4
    School: Abjuration
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Personal
    Area of Effect / Target: Caster
    Duration: 1 Round / Level
    Additional Counter Spells:
    Save: Harmless
    Spell Resistance: No

    A shimmering field of energy prevents all spells of level 3 or lower from affecting the caster.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eVis = EffectVisualEffect(VFX_DUR_GLOBE_MINOR);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eSpell = HideEffectIcon(EffectSpellLevelAbsorption(3, 0));

    // Link effects
    effect eLink = EffectLinkEffects(eVis, eSpell);
    eLink = EffectLinkEffects(eLink, eDur);

    // Add the Globe icon
    eLink = HideEffectIcon(eLink);
    eLink = EffectLinkEffects(eLink, EffectIcon(EFFECT_ICON_GLOBE_OF_INVUNERABILITY));

    float fDuration = GetDuration(nCasterLevel, ROUNDS);

    SignalSpellCastAt(oTarget, oCaster, FALSE);

    // Apply the VFX impact and effects
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

