//::///////////////////////////////////////////////
//:: Spell Resistance
//:: op_s_spellresist.nss
//:://////////////////////////////////////////////
/*
    Spell Resistance spells.

    Spell Resistance
    The target creature has its spell resistance set to 12, +1 per caster level.
    If the target already had a higher spell resistance, this spell has no effect.

    Mass Spell Resistance
    12 +1 caster level to 1 ally/2 levels in the area.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nMaxTargets;
    effect eVis, eLink, eImpact;
    switch (nSpellId)
    {
        case SPELL_SPELL_RESISTANCE:
            eVis = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
            eLink = EffectLinkEffects(EffectSpellResistanceIncrease(12 + nCasterLevel),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        break;
        case SPELL_MASS_SPELL_RESISTANCE:
            nMaxTargets = nCasterLevel;
            eImpact = EffectVisualEffect(VFX_FNF_LOS_NORMAL_20);
            eVis = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
            eLink = EffectLinkEffects(EffectSpellResistanceIncrease(12 + nCasterLevel),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        break;
        default:
            OP_Debug("[op_s_spellresist] No valid spell ID passed in: " + IntToString(nSpellId) + " name: " + GetSpellName(nSpellId));
            return;
        break;
    }

    float fDuration = GetDuration(nCasterLevel, MINUTES);

    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray) && nIndex < nMaxTargets; nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/25.0;

            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
        }
    }
    else
    {
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
    }
}


