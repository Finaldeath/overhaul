//::///////////////////////////////////////////////
//:: Cone Abilities
//:: op_a_cone.nss
//:://////////////////////////////////////////////
/*
    A mixture of damage and effect cones. Cones are pretty basic AOEs usually,
    just splitting some of the monster abilities into separate files to have
    it be slightly more organised.

    Beholder Antimagic Cone
    Cone of Acid
    Cone of Disease
    Cone of Fire
    Cone of Frost
    Cone of Lightning
    Cone of Poison
    Cone of Sonic
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDiceNum, nDiceSize, nDiceBonus, nDamageType;
    int nSavingThrow = SAVING_THROW_NONE;
    int nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nDamagePower = DAMAGE_POWER_ENERGY;
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;
    int nVis = VFX_INVALID;
    int bDragonBreath = FALSE;
    int nAppliedEffect = -1;
    int nImmunity = -1;
    int nDuration;
    // Basically Antimagic Cone only effects
    int bDispelMagic = FALSE;
    int nObjectType = OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE;

    switch (nSpellId)
    {
        case SPELLABILITY_BEHOLDER_ANTIMAGIC_CONE:
        {
            nVis = VFX_IMP_BREACH;
            bDispelMagic = TRUE;
            // What we dispel
            nObjectType = OBJECT_TYPE_CREATURE | OBJECT_TYPE_ITEM | OBJECT_TYPE_AREA_OF_EFFECT;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("[op_a_cone] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, nObjectType);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        // Antimagic cone
        if (bDispelMagic)
        {
            // Dispel - caster level is too high to contemplate!
            DoDispelMagic(oTarget, CASTER_LEVEL_ALWAYS_SUCCEEDS, nVis, fDelay, TRUE);

            // Apply the failure for 9 seconds. A rare neutral (negative + positive) effect!
            effect eLink = EffectLinkEffects(EffectSpellFailure(100),
                           EffectLinkEffects(EffectSpellImmunity(SPELL_ALL_SPELLS),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEUTRAL))));
            eLink = ExtraordinaryEffect(eLink);

            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 9.0));
        }
        else
        {
            SignalSpellCastAt();

            // Immunity checks
            if (nImmunity == -1 || GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
            {
                int bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);

                if (nDiceNum > 0)
                {
                    // Roll damage
                    int nDamage = GetDiceRoll(nDiceNum, nDiceSize, nDiceBonus);

                    // Damage modification based on save (half, with Reflex allowing feats to reduce further)
                    nDamage = GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);

                    if (nDamage > 0)
                    {
                        DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, nDamageType, nDamagePower));
                    }
                }


                // We can also (or only) apply an effect, only to creatures however.
                if (nAppliedEffect != -1 && GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
                {
                    if (!bSaved)
                    {
                        // Effect
                        effect eApply;
                        float fDuration;
                        int nDurationType = DURATION_TYPE_TEMPORARY;
                        switch (nAppliedEffect)
                        {
                            case EFFECT_TYPE_FRIGHTENED:
                            {
                                fDuration = GetScaledDuration(oTarget, nDuration, ROUNDS);
                                effect eEffect = GetScaledEffect(EffectFrightened(), oTarget);

                                eApply = EffectLinkEffects(eEffect,
                                         EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR),
                                                           EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
                            }
                            break;
                            case EFFECT_TYPE_PARALYZE:
                            {
                                fDuration = GetScaledDuration(oTarget, nDuration, ROUNDS);
                                effect eEffect = GetScaledEffect(EffectParalyze(), oTarget);

                                eApply = EffectLinkEffects(eEffect,
                                         EffectLinkEffects(EffectVisualEffect(VFX_DUR_PARALYZE_HOLD),
                                         EffectLinkEffects(EffectVisualEffect(VFX_DUR_PARALYZED),
                                                           EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE))));
                            }
                            break;
                            case EFFECT_TYPE_SLEEP:
                            {
                                fDuration = GetScaledDuration(oTarget, nDuration, ROUNDS);

                                eApply = EffectLinkEffects(EffectSleep(),
                                                           EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                            }
                            break;
                            case EFFECT_TYPE_SLOW:
                            {
                                fDuration = GetDuration(nDuration, ROUNDS);

                                eApply = EffectLinkEffects(EffectSlow(),
                                                           EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                            }
                            break;
                            case EFFECT_TYPE_ABILITY_DECREASE:
                            {
                                nDurationType = DURATION_TYPE_PERMANENT;

                                eApply = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, nDuration),
                                                           EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                            }
                            break;
                        }

                        eApply = ExtraordinaryEffect(eApply);

                        if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(nDurationType, eApply, oTarget, fDuration));
                    }
                }
            }
        }
    }
}


