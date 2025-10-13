//::///////////////////////////////////////////////
//:: Pale Master Feats
//:: op_f_palemaster
//:://////////////////////////////////////////////
/*
    Deathless Master Touch

    - Requires melee Touch attack
    - Save vs DC 17 to resist

    Epic:
    - Save DC raised by +1 for each 2 levels past 10th


    Undead Graft

    Pale Master may use their undead arm to paralyze
    foes for 1d6+2 rounds on a successful melee touch attack

    Save is 14 + pale master level/2

    Elves immune to this effect
    TaB pg 66;
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
        case SPELLABILITY_PM_DEATHLESS_MASTER_TOUCH:
        {
            effect eDeath = EffectDeath();
            int nVis = VFX_IMP_DEATH;
            int nVis2 = VFX_IMP_NEGATIVE_ENERGY;


            nSpellSaveDC = 17;

            // Epic save progression
            int nEpicMod = GetLevelByClass(CLASS_TYPE_PALEMASTER, oCaster) - 10;
            if (nEpicMod > 0)
            {
                nSpellSaveDC += (nEpicMod/2);
            }

            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                SignalSpellCastAt();

                if (GetCreatureSize(oTarget) > CREATURE_SIZE_LARGE)
                {
                    // Was Bioware's core rules. We just now default this on.
                    // (GetModuleSwitchValue(MODULE_SWITCH_SPELL_CORERULES_DMASTERTOUCH) == TRUE))
                    FloatingTextStrRefOnCreature(STRREF_FAILURE_TARGET_IS_TOO_LARGE, oCaster, FALSE);
                    return;
                }

                if (DoTouchAttack(oTarget, oCaster, TOUCH_MELEE))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NEGATIVE))
                    {
                        float fDelay = 0.1;
                        DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                    }
                }
            }
        }
        break;
        case SPELLABILITY_PM_UNDEAD_GRAFT_1:
        case SPELLABILITY_PM_UNDEAD_GRAFT_2:
        {
            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                if (GetRacialType(oTarget) == RACIAL_TYPE_ELF)
                {
                    FloatingTextStrRefOnCreature(STRREF_IMMUNE_TO_UNDEAD_GRAFT, oTarget, FALSE);
                    FloatingTextStrRefOnCreature(STRREF_IMMUNE_TO_UNDEAD_GRAFT, oCaster, FALSE);
                    return;
                }

                effect eLink = EffectLinkEffects(EffectParalyze(),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_ICESKIN),
                                                 EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION))));
                int nVis = VFX_IMP_NEGATIVE_ENERGY;

                // Cannot dispel this ability
                eLink = ExtraordinaryEffect(eLink);

                nSpellSaveDC = 14 + GetLevelByClass(CLASS_TYPE_PALEMASTER)/2;

                float fDuration = GetDuration(d6() + 2, ROUNDS);

                if (DoTouchAttack(oTarget, oCaster, TOUCH_MELEE))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NEGATIVE))
                    {
                        ApplyVisualEffectToObject(nVis, oTarget);
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                    }
                }
                else
                {
                    // * GZ: According to TaB missed attacks are not wasted.
                    IncrementRemainingFeatUses(oCaster, GetSpellFeatId());
                }
            }

        }
        break;
        default:
        {
            Debug("[Pale Master] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }
}

