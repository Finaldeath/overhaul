//::///////////////////////////////////////////////
//:: Cantrips
//:: op_s_cantrips.nss
//:://////////////////////////////////////////////
/*
    Most of the cantrips. More complicated ones (eg Read Magic) are in their
    own file or grouped with other spells (eg Resistance).

    Acid Splash   - 1d4 + 1 acid damage
    Daze          - Dazed for 2 rounds (will negates)
    Electric Jolt - 1d4 + 1 electrical damage
    Flare         - -1 attack for 10 rounds (fortitude negates)
    Light         - Light VFX for 1 hour/level
    Ray of Frost  - 1d4 + 1 cold damage
    Virtue        - 1 temp HP 1 minute/level

    MIGHT add in touch attacks to the damage spells, or make them save for half.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int bDamage = FALSE, nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    effect eVis, eDamage, eLink;
    float fDuration;

    switch (nSpellId)
    {
        case SPELL_ACID_SPLASH:
        {
            bDamage = TRUE;
            eVis = EffectVisualEffect(VFX_IMP_ACID_S);
            eDamage = EffectDamage(GetDiceRoll(1, 4, 1), DAMAGE_TYPE_ACID);
        }
        break;
        case SPELL_DAZE:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            fDuration = GetDuration(2, ROUNDS);

            eVis = EffectVisualEffect(VFX_IMP_DAZED_S);
            eLink = EffectLinkEffects(EffectDazed(),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                      EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
        }
        break;
        case SPELL_ELECTRIC_JOLT:
        {
            bDamage = TRUE;
            eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
            eDamage = EffectDamage(GetDiceRoll(1, 4, 1), DAMAGE_TYPE_ELECTRICAL);
        }
        break;
        case SPELL_FLARE:
        {
            nSavingThrow = SAVING_THROW_FORT;
            fDuration = GetDuration(10, ROUNDS);

            eVis = EffectVisualEffect(VFX_IMP_FLAME_S);
            eLink = EffectLinkEffects(EffectAttackDecrease(1),
                                      EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
        }
        break;
        case SPELL_LIGHT:
        {
            // TODO Handle item being targeted here!
            fDuration = GetDuration(nCasterLevel, HOURS);

            eVis = EffectVisualEffect(VFX_IMP_MAGBLUE);
            eLink = EffectLinkEffects(EffectVisualEffect(VFX_DUR_LIGHT_WHITE_20),
                                      EffectVisualEffect(VFX_DUR_CESSATE_NEUTRAL));
        }
        break;
        case SPELL_RAY_OF_FROST:
        {
            bDamage = TRUE;
            eVis = EffectVisualEffect(VFX_IMP_FROST_S);
            eDamage = EffectDamage(GetDiceRoll(1, 4, 1), DAMAGE_TYPE_COLD);
            // Also apply a beam
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, UnyieldingEffect(EffectBeam(VFX_BEAM_COLD, oCaster, BODY_NODE_HAND)), oTarget, 1.7);
        }
        break;
        case SPELL_VIRTUE:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);

            eVis = EffectVisualEffect(VFX_IMP_HOLY_AID);
            eLink = EffectLinkEffects(EffectTemporaryHitpoints(1),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
        }
        break;
        default:
        {
            OP_Debug("[Cantrips] Unknown spell ID: " + IntToString(nSpellId), LOG_LEVEL_ERROR);
            return;
        }
        break;
    }

    // If hostile we check standard hostile targeting
    if (!bHostile || GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        // Always check SR if hostile
        if (!bHostile || !DoResistSpell(oTarget, oCaster))
        {
            // Damaging spells
            if (bDamage)
            {
                ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
            }
            // Duration spells
            else
            {
                if (nSavingThrow == -1 || !DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType))
                {
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                }
            }
        }
    }
}

