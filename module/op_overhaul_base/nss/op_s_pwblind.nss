//::///////////////////////////////////////////////
//:: Power Word, Blind
//:: op_s_pwblind.nss
//:://////////////////////////////////////////////
/*
    This spell blinds one or more creatures. It affects the creatures with the
    lowest current Hit Point totals first, selecting subjects one at a time
    until the next target would put it over the limit of 200.

    The duration of the spell depends on the total hit points of the affected
    creatures:
    Up to 50: Permanent
    51 to 100: 1d4+1 minutes
    101 to 200: 1d4+1 rounds
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Visuals and effect
    effect eVis = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    effect eLink = EffectLinkEffects(EffectBlindness(),
                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

    effect eAOE = EffectVisualEffect(VFX_FNF_PWBLIND);
    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eAOE, lTarget);

    int nHPRemaining = 200;

    // Add all creatures of a given hostility to the array
    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_LOWEST_HP, SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget, TRUE);

    // Loop array
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
                // Check immunity - we only test this once the target is "valid" HP wise, and still remove that HP from the pool
                if (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_BLINDNESS, oCaster))
                {
                    float fDelay = GetRandomDelay(0.1, 0.25);

                    if (!DoResistSpell(oTarget, oCaster, fDelay))
                    {
                        // Up to 50: Permanent
                        // 51 to 100: 1d4+1 minutes
                        // 101 to 200: 1d4+1 rounds
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                        if (nCurrentHP <= 50)
                        {
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget));
                        }
                        else if (nCurrentHP <= 100)
                        {
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(d4() + 1, MINUTES)));
                        }
                        else
                        {
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(d4() + 1, ROUNDS)));
                        }
                    }
                }
            }
        }
    }
}

