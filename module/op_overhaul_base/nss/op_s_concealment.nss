//::///////////////////////////////////////////////
//:: Concealment Spells
//:: op_s_concealment
//:://////////////////////////////////////////////
/*
    Blur
    The subject's outline appears blurred. This distortion grants the subject
    20% concealment.

    Entropic Shield
    A magical field appears around the caster, causing any nearby enemies a
    20% chance to miss on ranged attacks.

    Displacement
    The target gains 50% concealment, displacing the caster's image several feet
    to the side, similar to the abilities of a displacer beast.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDur, nPercentage, nMissType = MISS_CHANCE_TYPE_NORMAL;
    float fDuration;

    switch (nSpellId)
    {
        case SPELL_BLUR:
            nDur = VFX_DUR_BLUR;
            nPercentage = 20;
            fDuration = GetDuration(nCasterLevel, MINUTES);
        break;
        case SPELL_ENTROPIC_SHIELD:
            nPercentage = 20;
            nDur = VFX_DUR_GLOW_LIGHT_PURPLE;
            nMissType = MISS_CHANCE_TYPE_VS_RANGED;
            fDuration = GetDuration(nCasterLevel, MINUTES);
        break;
        case SPELL_DISPLACEMENT:
            nDur = VFX_DUR_DISPLACEMENT;
            nPercentage = 50;
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        break;
        default:
            OP_Debug("[op_s_concealment] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    effect eLink = EffectLinkEffects(EffectConcealment(nPercentage, nMissType),
                   EffectLinkEffects(EffectVisualEffect(nDur),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

    SignalSpellCastAt();

    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_AC_BONUS), oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

