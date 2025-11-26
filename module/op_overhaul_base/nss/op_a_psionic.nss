//:://////////////////////////////////////////////
//:: Psionic Abilties
//:: op_a_psionic
//:://////////////////////////////////////////////
/*
    Psionic Charm Monster

    Psionic Inertial Barrier

    Psionic Mass Concussion

    Psionic Mind Blast

    Psionic Mind Blast Personal

    Illithid Mind Blast
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    switch (nSpellId)
    {
        case SPELLABILITY_PSIONIC_CHARM_MONSTER:
        {
            nSpellSaveDC = 17;
            float fDuration = GetDuration(4, ROUNDS);

            // NB: Changed to Selective Hostile since why would you confuse allies?
            json jArray = GetArrayOfTargets(SPELL_TARGET_SELECTIVEHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                SignalSpellCastAt();

                float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

                if (!GetIsMindflayer(oTarget) && !GetIsImmuneWithFeedback(oTarget, oCaster,  IMMUNITY_TYPE_CONFUSED))
                {
                    if(!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                    {
                        effect eLink = GetScaledEffect(EFFECT_TYPE_CONFUSED, oTarget);

                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_CONFUSION_S, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                    }
                }
            }
        }
        break;
        case SPELLABILITY_PSIONIC_INERTIAL_BARRIER:
        {
            int nDuration = GetHitDice(oCaster);
            int nDamagePower = DAMAGE_POWER_PLUS_TWENTY;
            // Shifter polymorph
            if (GetIsPolymorphed(oCaster))
            {
                nDuration = (GetLevelByClass(CLASS_TYPE_SHIFTER, oCaster)/3) + 1;
                nDamagePower = GetDamagePowerPlusValue(nDuration);
            }
            int nReduction = nDuration/2;
            if(nReduction < 10)
            {
               nReduction = 10;
            }
            float fDuration = GetDuration(nDuration, ROUNDS);
            effect eLink = EffectLinkEffects(EffectDamageReduction(nReduction, nDamagePower, nDuration * 10),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));


            SignalSpellCastAt();

            // Remove previous castings
            RemoveEffectsFromSpell(oCaster, nSpellId);

            ApplyVisualEffectToObject(VFX_IMP_AC_BONUS, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        break;
        case SPELLABILITY_PSIONIC_MASS_CONCUSSION:
        {
            nCasterLevel = GetHitDice(oCaster);

            effect eKnockdown = ExtraordinaryEffect(EffectKnockdown());
            effect eLink = ExtraordinaryEffect(EffectLinkEffects(EffectAbilityDecrease(ABILITY_WISDOM, 3),
                                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

            ApplyVisualEffectAtLocation(VFX_FNF_SCREEN_SHAKE, lTarget);
            ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_10, lTarget);

            json jArray = GetArrayOfTargets(SPELL_TARGET_SELECTIVEHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                if (oTarget != oCaster)
                {
                    SignalSpellCastAt();

                    float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_BIGBYS_FORCEFUL_HAND, oTarget));

                    int nDamage = d6(nCasterLevel/2) + GetAbilityModifier(ABILITY_WISDOM);
                    DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_ENERGY));

                    if (!GetIsMindflayer(oTarget) && !GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_MIND_SPELLS))
                    {
                        if(!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                        {
                            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_CONFUSION_S, oTarget));
                            // Static duration
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oTarget, 4.0));
                            // Randomised duration
                            float fDuration = GetDuration(d6() + 3, ROUNDS);
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                        }
                    }
                }
            }
        }
        break;
        case SPELLABILITY_ILLITHID_MIND_BLAST:
        case SPELLABILITY_PSIONIC_MIND_BLAST_PERSONAL:
        case SPELLABILITY_PSIONIC_MIND_BLAST:
        {
            // Not enforcing any use limit on this as part of Shifter revamp
            // Fixes from original are random duration for each target, standard
            // other AOE fixes (eg always a nice delay). Standardised all the
            // durations to be d4 instead of the personal blast being d3 as well.
            // It also is standard hostile for all versions.

            int nDice = GetHitDice(oCaster) / 2;
            if (GetIsPolymorphed(oCaster))
            {
                nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_EASY) + GetAbilityModifier(ABILITY_WISDOM, oCaster);
                nDice = max(1, GetLevelByClass(CLASS_TYPE_SHIFTER, oCaster)/3);
            }
            else if (nSpellId == SPELLABILITY_ILLITHID_MIND_BLAST)
            {
                // Set DC, Illithid one basically is shifter OR a simple base DC
                nSpellSaveDC = 19;
            }
            else
            {
                // DC increases with HD
                nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_EASY) + GetAbilityModifier(ABILITY_WISDOM, oCaster);
            }

            if (nSpellId == SPELLABILITY_PSIONIC_MIND_BLAST_PERSONAL)
            {
                ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_20, lTarget);
                ApplyVisualEffectAtLocation(VFX_IMP_PULSE_WIND, lTarget);
            }

            json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                if (oTarget != oCaster && !GetIsMindflayer(oTarget))
                {
                    SignalSpellCastAt();

                    float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

                    // First check for effects of this spell, then damage, else stun
                    if (GetHasSpellEffect(nSpellId, oTarget))
                    {
                        int nDamage = d6(nDice);
                        DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_MAGICAL));
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_STUN, oTarget));
                    }
                    else if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_STUN))
                    {
                        if(!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                        {
                            effect eLink = GetScaledEffect(EFFECT_TYPE_STUNNED, oTarget);

                            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_DOMINATE_S, oTarget));
                            // Randomised duration
                            float fDuration = GetDuration(d4(), ROUNDS, EFFECT_TYPE_STUNNED);
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                        }
                    }
                }
            }
        }
        break;
        default:
        {
            Debug("No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }
}

