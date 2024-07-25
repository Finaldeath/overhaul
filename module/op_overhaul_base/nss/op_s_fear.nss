//::///////////////////////////////////////////////
//:: Fear
//:: op_s_fear
//:://////////////////////////////////////////////
/*
    Fear spells.

    Need to think about fear and it's effects in the state script, some of the
    penalties like -2 to attack rolls is useless when fear is in fact in place
    since that stops them attacking!

    Cause Fear
    5HD max, 1d4 rounds of fear + some other penalties.

    Fear
    Fear effect, 1 round/level duration. AOE.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink;
    int nImpact = VFX_NONE, nVis = VFX_NONE, nHDLimit = 99999;
    int nDuration;

    switch (nSpellId)
    {
        case SPELL_SCARE: // Cause Fear
            // Note that EffectFrightened has a built in -2 to saves.
            // We probably should link the effects here to the state script, or perhaps tie it to one spell ID. But leaving it simple for now.
            // One other issue is fear generally just stops you moving at all. We'd need to open fear up to be on/off to have the damage
            // and attack penalties even mean anything.
            eLink = EffectLinkEffects(EffectFrightened(),
                    EffectLinkEffects(EffectDamageDecrease(2, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                    EffectLinkEffects(EffectAttackDecrease(2),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR),
                                      EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)))));
            nHDLimit  = 5;
            // NB: can't metamagic the d4
            nDuration = d4();
            break;
        case SPELL_FEAR:
            eLink = EffectLinkEffects(EffectFrightened(),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR),
                                      EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            nDuration = nCasterLevel;
            break;
        default:
            Debug("[Sleep op_s_sleep] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    // AOE?
    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        ApplyVisualEffectAtLocation(nImpact, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_LOWEST_HD);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            int nHD = GetHitDice(oTarget);

            // We always signal event to anyone in the AOE, but these cases
            // stop the spell applying entirely (and don't affect the HD pool)
            if (nHD <= nHDLimit)
            {
                float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    if (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_FEAR, oCaster))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_FEAR, fDelay))
                        {
                            DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                            float fDuration = GetScaledDuration(oTarget, nDuration, ROUNDS);
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                        }
                    }
                }
            }
        }
    }
    else
    {
        SignalSpellCastAt();

        int nHD = GetHitDice(oTarget);

        if (nHD <= nHDLimit)
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                if (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_FEAR, oCaster))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_FEAR))
                    {
                        ApplyVisualEffectToObject(nVis, oTarget);
                        float fDuration = GetScaledDuration(oTarget, nDuration, ROUNDS);
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                    }
                }
            }
        }
    }
}
