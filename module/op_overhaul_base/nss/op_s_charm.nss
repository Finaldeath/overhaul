//::///////////////////////////////////////////////
//:: Charm spells
//:: op_s_charm
//:://////////////////////////////////////////////
/*
    Single target:

    Charm Person - Humanoid only
    Charm Person or Animal - Humanoid or Animals
    Charm Monster - Anything

    AOE:
    Mass Charm - Humanoid only

    Bolt, Charm - Done in Bolt script
    Gaze, Charm - Done in Gaze script

    Note: Not including "Psionic Charm Monster" (SPELLABILITY_CHARMMONSTER)
          which instead does confusion because that's what Bioware did.

    Charm is basically a "Don't attack me, attack my allies!" spell, but hey
    it works reasonably well (and also interrupts their action).

    Tempted to make it affect PCs as normal...
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// Charms global oTarget
void Charm(float fDelay = 0.0);

void main()
{
    if (DoSpellHook()) return;

    // Multi target spells
    if (nSpellId == SPELL_MASS_CHARM)
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_20), lTarget);

        // Add all creatures of a given hostility to the array
        // Note old version of the spell didn't test LOS.
        json jArray = GetArrayOfTargets(SPELL_TARGET_SELECTIVEHOSTILE, SORT_METHOD_LOWEST_HD, SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget, TRUE);

        // Loop array
        int nIndex;
        int nPool = nCasterLevel * 2;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            // Must be enough points in the pool
            if (nPool >= GetHitDice(oTarget))
            {
                nPool -= GetHitDice(oTarget);
                float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20.0;
                Charm(fDelay);
            }
        }
    }
    else
    {
        Charm();
    }
}

void Charm(float fDelay)
{
    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt(oTarget);

        // Validate target and set duration and some other variables if needed
        float fDuration;
        switch (nSpellId)
        {
            // No target validation needed
            case SPELL_CHARM_MONSTER:
            {
                fDuration = GetScaledDuration(oTarget, 3 + (nCasterLevel / 2), ROUNDS);
            }
            break;
            // Certain racial types
            case SPELL_MASS_CHARM:
            {
                if (!GetIsHumanoidCreature(oTarget)) return;
                fDuration = GetScaledDuration(oTarget, nCasterLevel / 2, ROUNDS);
            }
            break;
            case SPELL_CHARM_PERSON:
            {
                if (!GetIsHumanoidCreature(oTarget)) return;
                fDuration = GetScaledDuration(oTarget, 2 + (nCasterLevel / 3), ROUNDS);
            }
            break;
            case SPELL_CHARM_PERSON_OR_ANIMAL:
            {
                if (!GetIsHumanoidCreature(oTarget) &&
                     GetRacialType(oTarget) != CLASS_TYPE_ANIMAL) return;
                fDuration = GetScaledDuration(oTarget, 2 + (nCasterLevel / 3), ROUNDS);
            }
            break;
        }
        if (!DoResistSpell(oTarget, oCaster))
        {
            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS))
            {
                effect eVis = EffectVisualEffect(VFX_IMP_CHARM);

                effect eLink = EffectLinkEffects(GetScaledEffect(EffectCharmed(), oTarget),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
            }
        }
    }
}
