//::///////////////////////////////////////////////
//:: Bigby's Spells
//:: op_s_bigby
//:://////////////////////////////////////////////
/*
    Bigby's Spells, since we're dealing with some specalist stuff like grapple
    and attack rolls and keeps them neatly together.

    Bigby's Interposing Hand (5)
    -10 to attack rolls.

    Bigby's Forceful Hand (6)
    A giant hand appears and attempts to bull rush one target once per round.
    A target that is bull rushed is knocked down for 1 round.

    Bull rush checks are made with an opposed roll; caster: 1d20 + 10 (hand
    strength modifier) + 2 (hand size modifier) + 2 (bonus for charging) vs.
    target: 1d20 + strength modifier + size modifier.

    Bigby's Grasping Hand (7)
    A giant hand appears and attacks the target. If the hand hits and succeeds
    in a grapple check the opponent will be held for the duration of the spell.

    Attacks are made at d20 + caster ability modifier + caster level + 10 (hand
    strength modifier) -1 (hand large size modifier) vs. target armor class.

    Grapple checks are made with an opposed roll; caster: 1d20 + caster ability
    modifier + caster level + 10 (hand strength modifier) + 4 (hand size
    modifier) vs. target: 1d20 + base attack bonus + strength modifier +
    size modifier.

    Bigby's Clenched Fist (8)
    A giant hand appears and attacks the target, once each round for the
    duration of the spell. Each hit causes 1d8+11 points of magical damage to
    the target and if they fail their saving throw they are stunned for that
    round as well.

    Attacks are made at d20 + caster ability modifier + caster level + 11
    (hand strength modifier) -1 (hand large size modifier) vs. target armor
    class.

    Bigby's Crushing Hand (9)
    A giant hand appears and attacks the target. If it hits and succeeds in a
    grapple check, the target is held fast for the duration of the spell and
    suffers 2d6+12 points of magical damage each round.

    Attacks are made at d20 + caster ability modifier + caster level + 12 (hand
    strength modifier) -1 (hand large size modifier) vs. target armor class.

    Grapple checks are made with an opposed roll; caster: 1d20 + caster ability
    modifier + caster level + 12 (hand strength modifier) + 4 (hand size
    modifier) vs. target: 1d20 + base attack bonus + strength modifier + size
    modifier.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void DoSpellEffects(int bInitial = FALSE);
// Failed all the checks so apply something
void PerRoundImpact(int bSaveResult);

void main()
{
    if (DoSpellHook()) return;

    // Can't apply the same spell to the same person again
    if (GetHasSpellEffect(nSpellId, oTarget))
    {
        SendMessageToPC(oCaster, "*Target already affected by " + GetSpellName(nSpellId) + ".*");
        return;
    }

    DoSpellEffects(TRUE);
}

void DoSpellEffects(int bInitial = FALSE)
{
    if (bInitial == FALSE)
    {
        if (!GetHasSpellEffect(nSpellId, oTarget) || !GetIsObjectValid(oCaster)) return;
    }

    effect eLink;
    int bRepeatedImpact = TRUE, bPerRoundImpact = TRUE;
    int bPersistentNeedsChecks = FALSE;
    int nVis = VFX_NONE;
    int nSpellSave = -1;
    int bBullRush = FALSE, bAttack = FALSE, bGrapple = FALSE;
    int nHandStrengthModifier;

    switch (nSpellId)
    {
        case SPELL_BIGBYS_INTERPOSING_HAND:
        {
            bPersistentNeedsChecks = TRUE;
            bRepeatedImpact = FALSE;
            bPerRoundImpact = FALSE;
            eLink = EffectLinkEffects(EffectAttackDecrease(10),
                                      EffectVisualEffect(VFX_DUR_BIGBYS_INTERPOSING_HAND));
        }
        break;
        case SPELL_BIGBYS_FORCEFUL_HAND:
        {
            nVis = VFX_IMP_BIGBYS_FORCEFUL_HAND;
            eLink = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
            bBullRush = TRUE;
            nHandStrengthModifier = 10;
        }
        break;
        case SPELL_BIGBYS_GRASPING_HAND:
        {
            eLink = EffectVisualEffect(VFX_DUR_BIGBYS_GRASPING_HAND);
            bAttack = TRUE;
            bGrapple = TRUE;
            nHandStrengthModifier = 10;
        }
        break;
        case SPELL_BIGBYS_CLENCHED_FIST:
        {
            eLink = EffectVisualEffect(VFX_DUR_BIGBYS_CLENCHED_FIST);
            bAttack = TRUE;
            nSpellSave = SAVING_THROW_FORT;
            nHandStrengthModifier = 11;
        }
        break;
        case SPELL_BIGBYS_CRUSHING_HAND:
        {
            eLink = EffectVisualEffect(VFX_DUR_BIGBYS_CRUSHING_HAND);
            bAttack = TRUE;
            bGrapple = TRUE;
            nHandStrengthModifier = 12;
        }
        break;
        default:
        {
            Debug("[op_s_damage] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        if (!bAttack || DoAttackRoll(oTarget, oCaster, nCasterLevel + GetClassSpellcasterAbilityModifier(nCasterClass), nHandStrengthModifier, CREATURE_SIZE_LARGE))
        {
            if (!bBullRush || DoBullRushCheck(oTarget, oCaster, nHandStrengthModifier, CREATURE_SIZE_LARGE, 2))
            {
                if (!bGrapple || DoGrappleCheck(oTarget, oCaster, nCasterLevel + GetClassSpellcasterAbilityModifier(nCasterClass) + nHandStrengthModifier, CREATURE_SIZE_LARGE))
                {
                    if (!DoResistSpell(oTarget, oCaster))
                    {
                        int bSaveResult = 0;

                        if (nSpellSave != -1)
                        {
                            bSaveResult = DoSavingThrow(oTarget, oCaster, nSpellSave, nSpellSaveDC);
                        }

                        ApplyVisualEffectToObject(nVis, oTarget);

                        if (bPerRoundImpact)
                        {
                            PerRoundImpact(bSaveResult);
                        }
                        // Effects if needs checks
                        if (bInitial && bPersistentNeedsChecks == TRUE)
                        {
                            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
                        }
                    }
                }
            }
        }
    }
    // Initial (tracking for most) VFX regardless of the above
    if (bInitial && bPersistentNeedsChecks == FALSE)
    {
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
    }
    // Apply the effects of the given spell and loop back around if repeating
    if (bRepeatedImpact) DelayCommand(6.0, DoSpellEffects());
}

// Failed all the checks so apply something
void PerRoundImpact(int bSaveResult)
{
    effect eLink;
    int nDamage;
    float fDuration = 6.0;
    switch (nSpellId)
    {
        case SPELL_BIGBYS_FORCEFUL_HAND:
        {
            eLink = EffectLinkEffects(EffectKnockdown(),
                                      EffectIcon(EFFECT_ICON_KNOCKDOWN));
            fDuration = 5.5; // Needs to be less to apply again properly it seems...
        }
        break;
        case SPELL_BIGBYS_GRASPING_HAND:
        {
            eLink = EffectLinkEffects(IgnoreEffectImmunity(EffectParalyze()),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_PARALYZED),
                                      EffectVisualEffect(VFX_DUR_PARALYZE_HOLD))));
        }
        break;
        case SPELL_BIGBYS_CLENCHED_FIST:
        {
            nDamage = GetDiceRoll(1, 8, 11);
            eLink = EffectLinkEffects(IgnoreEffectImmunity(EffectStunned()),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED),
                                      EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
        }
        break;
        case SPELL_BIGBYS_CRUSHING_HAND:
        {
            nDamage = GetDiceRoll(2, 6, 12);
            eLink = EffectLinkEffects(IgnoreEffectImmunity(EffectParalyze()),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_PARALYZED),
                                      EffectVisualEffect(VFX_DUR_PARALYZE_HOLD))));
        }
        break;
        default:
        {
            Debug("[op_s_bigby] No valid spell ID passed into PerRoundImpact: " + IntToString(nSpellId));
            return;
        }
        break;
    }
    if (nDamage > 0)
    {
        ApplyDamageToObject(oTarget, nDamage);
    }
    if (!bSaveResult)
    {
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
    }
}
