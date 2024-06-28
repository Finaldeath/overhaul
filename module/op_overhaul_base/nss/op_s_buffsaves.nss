//::///////////////////////////////////////////////
//:: Buff Saves
//:: op_s_buffsaves.nss
//:://////////////////////////////////////////////
/*
    Resistance
    Grants the target creature a +1 bonus to all saving throws.

    Superior Resistance
    +3 to saves.

    Major Resistance
    +6 to saves.

    Protection from Spells
    Within the area of effect, up to one ally per 4 caster levels receives a
    +8 bonus on all saving throws against spells.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Bonus to increase and duration
    int bAOE, nMaxTargets;
    float fDuration;
    effect eImpact, eVis, eLink;

    switch (nSpellId)
    {
        case SPELL_RESISTANCE:
        {
            bAOE = FALSE;
            fDuration = GetDuration(2, MINUTES);

            eVis = EffectVisualEffect(VFX_IMP_HEAD_HOLY);
            eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 1),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
        }
        break;
        case SPELL_SUPERIOR_RESISTANCE:
        {
            bAOE = FALSE;
            fDuration = GetDuration(nCasterLevel, HOURS);

            eVis = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
            eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 3),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
        }
        break;
        case SPELL_MAJOR_RESISTANCE:
        {
            bAOE = FALSE;
            fDuration = GetDuration(nCasterLevel, HOURS);

            eVis = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
            eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 6),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
        }
        break;
        case SPELL_PROTECTION_FROM_SPELLS:
        {
            bAOE = TRUE;
            nMaxTargets = max(1, nCasterLevel/4);
            fDuration = GetDuration(nCasterLevel, MINUTES);

            eImpact = EffectVisualEffect(VFX_FNF_LOS_NORMAL_10);
            eVis = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
            eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 8, SAVING_THROW_TYPE_SPELL),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        default:
        {
            OP_Debug("[op_s_buffsaves] Unknown spell ID: " + IntToString(nSpellId), LOG_LEVEL_ERROR);
            return;
        }
        break;
    }

    // Multi target spells
    if (bAOE)
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES, SORT_METHOD_DISTANCE, SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget, TRUE);

        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray) && nIndex < nMaxTargets; nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);
            SignalSpellCastAt();

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20.0;

            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            DelayCommand(fDelay + 1.0, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
        }
    }
    else
    {
        SignalSpellCastAt();
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        DelayCommand(1.0, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
    }
}

