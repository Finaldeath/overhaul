//::///////////////////////////////////////////////
//:: Power Word
//:: op_s_powerword.nss
//:://////////////////////////////////////////////
/*
    Power Word: Stun
    Automatically stuns a single target for a duration based on the target's
    currnet Hit Points:
    Up to 50 Hit Points: 4d4 rounds
    51-100 Hit Points: 2d4 rounds
    101-150 Hit Points: 1d4 rounds

    Power Word: Blind
    This spell blinds one or more creatures. It affects the creatures with the
    lowest current Hit Point totals first, selecting subjects one at a time
    until the next target would put it over the limit of 200.

    The duration of the spell depends on the total hit points of the affected
    creatures:
    Up to 50: Permanent
    51 to 100: 1d4+1 minutes
    101 to 200: 1d4+1 rounds

    Power Word: Kill
    This spell may be cast on a single creature or as an area effect. A
    targeted creature of up to 100 current Hit Points is killed instantly. As
    an area effect, this spell will kill all creatures with fewer than 20
    current Hit Points, to a maximum total of 200 Hit Points.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink, eInstant;
    int nHPRemaining, bAOE = FALSE, nImpact = VFX_NONE, nVis = VFX_NONE;
    int nEffectType;

    switch (nSpellId)
    {
        case SPELL_POWER_WORD_STUN:
        {
            nEffectType = EFFECT_TYPE_STUNNED;
            nImpact = VFX_FNF_PWSTUN;
            nVis    = VFX_IMP_STUN;
        }
        break;
        case SPELL_POWER_WORD_BLIND:
        {
            bAOE         = TRUE;
            nHPRemaining = 200;
            nEffectType  = EFFECT_TYPE_BLINDNESS;
            nImpact      = VFX_FNF_PWBLIND;
            nVis         = VFX_IMP_BLIND_DEAF_M;
        }
        break;
        case SPELL_POWER_WORD_KILL:
        {
            nEffectType = EFFECT_TYPE_DEATH;
            nImpact     = VFX_FNF_PWKILL;
            nVis        = VFX_IMP_DEATH;

            if (!GetIsObjectValid(oTarget))
            {
                bAOE         = TRUE;
                nHPRemaining = 200;
            }
        }
        break;
        default:
        {
            Debug("[Power Word Spells] Unknown spell ID: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    if (bAOE)
    {
        // Sort by lowest HP for Power Word spells
        json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_LOWEST_HP);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            // We signal this event against everyone even if it should stop early.
            SignalSpellCastAt();

            // We don't affect dead creatures as much as we'd like to
            if (!GetIsDead(oTarget))
            {
                // Calculate the HP change to our running total
                int nCurrentHP = GetCurrentHitPoints(oTarget);
                nHPRemaining -= nCurrentHP;

                // If we have at least 0 (ie if the first target had 200 HP we can still affect them)
                if (nHPRemaining >= 0)
                {
                    float fDelay = GetRandomDelay(0.1, 0.25);

                    if (!DoResistSpell(oTarget, oCaster, fDelay))
                    {
                        effect eApply = GetEffectLink(nEffectType);
                        if (nSpellId == SPELL_POWER_WORD_BLIND)
                        {
                            // Up to 50: Permanent
                            // 51 to 100: 1d4+1 minutes
                            // 101 to 200: 1d4+1 rounds
                            DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                            if (nCurrentHP <= 50)
                            {
                                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eApply, oTarget));
                            }
                            else if (nCurrentHP <= 100)
                            {
                                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oTarget, GetDuration(d4() + 1, MINUTES)));
                            }
                            else
                            {
                                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oTarget, GetDuration(d4() + 1, ROUNDS)));
                            }
                        }
                        else if (nSpellId == SPELL_POWER_WORD_KILL)
                        {
                            // 20HP limit
                            if (nCurrentHP <= 20)
                            {
                                DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eApply, oTarget));
                            }
                        }
                    }
                }
            }
        }
    }
    // Single target
    else
    {
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            // We don't affect dead creatures as much as we'd like to
            if (!GetIsDead(oTarget))
            {
                if (!DoResistSpell(oTarget, oCaster))
                {
                    int nCurrentHP = GetCurrentHitPoints(oTarget);
                    effect eApply = GetEffectLink(nEffectType);
                    switch (nSpellId)
                    {
                        case SPELL_POWER_WORD_STUN:
                        {
                            if (nCurrentHP <= 150)
                            {
                                float fDuration;
                                if (nCurrentHP <= 50)
                                {
                                    fDuration = GetDuration(GetDiceRoll(4, 4), ROUNDS);
                                }
                                else if (nCurrentHP <= 100)
                                {
                                    fDuration = GetDuration(GetDiceRoll(2, 4), ROUNDS);
                                }
                                else
                                {
                                    fDuration = GetDuration(GetDiceRoll(1, 4), ROUNDS);
                                }
                                ApplyVisualEffectToObject(nVis, oTarget);
                                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oTarget, fDuration);
                            }
                        }
                        break;
                        case SPELL_POWER_WORD_KILL:
                        {
                            if (nCurrentHP <= 100)
                            {
                                ApplyVisualEffectToObject(nVis, oTarget);
                                ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eApply, oTarget);
                            }
                        }
                        break;
                    }
                }
            }
        }
    }
}
