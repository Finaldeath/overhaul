//::///////////////////////////////////////////////
//:: Globe of Invulnerability and Minor Globe of Invulnerability
//:: op_s_globe.nss
//:://////////////////////////////////////////////
/*
    Globe of Invulnerability

    A shimmering field of energy prevents all spells of level 4 or lower from affecting the caster.

    Minor Globe of Invulnerability

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

    int nAbsorptionLevel = nSpellId == SPELL_GLOBE_OF_INVULNERABILITY ? 4 : 3;

    effect eLink = EffectLinkEffects(EffectSpellLevelAbsorption(4, 0),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_GLOBE_MINOR),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

    // Add the Globe icon
    eLink = HideEffectIcon(eLink);
    eLink = EffectLinkEffects(eLink, EffectIcon(EFFECT_ICON_GLOBE_OF_INVUNERABILITY));

    float fDuration = GetDuration(nCasterLevel, ROUNDS);

    SignalSpellCastAt();

    // Apply the VFX impact and effects
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

