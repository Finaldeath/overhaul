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

    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;
    int nImpact = VFX_NONE;
    int nPool = 999999;

    switch (nSpellId)
    {
        case SPELL_MASS_CHARM:
            nImpact = VFX_FNF_LOS_NORMAL_20;
            nTargetType = SPELL_TARGET_SELECTIVEHOSTILE;
            nPool = nCasterLevel * 2;
            break;
        case SPELL_CHARM_MONSTER:
        case SPELL_CHARM_PERSON:
        case SPELL_CHARM_PERSON_OR_ANIMAL:
            nTargetType = SPELL_TARGET_STANDARDHOSTILE;
            break;
        default:
            Debug("[Sleep op_s_sleep] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_LOWEST_HD);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        // Must be enough points in the pool
        if (nPool >= GetHitDice(oTarget))
        {
            nPool -= GetHitDice(oTarget);
            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20.0;

            // Even though the spell is "Hostile" for PvP purposes we'll leave it as being non-hostile
            // This stops the charm effect being removed (right away), and keeps to the behaviour to how
            // Bioware's spells worked
            SignalSpellCastAt(oTarget, oCaster, SIGNAL_HOSTILE_FALSE_BUT_REALLY_TRUE);

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
                    effect eLink = GetEffectLink(EFFECT_TYPE_CHARMED, oTarget);

                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_CHARM, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                }
            }
        }
    }
}

