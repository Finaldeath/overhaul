//:://////////////////////////////////////////////
//:: Combust and Inferno
//:: op_s_combust
//:://////////////////////////////////////////////
/*
    Combust

    This spell makes a creature burst into flame. The initial eruption of flame
    causes 2d6 fire damage +1 point per caster level (maximum +10) with no
    saving throw. Further, the creature must make a Reflex save or catch fire
    taking a further 1d6 +1 point per caster level (maximum +10) points of
    damage. This will continue until the Reflex save is made or the duration
    expires.

    Inferno

    The caster causes a target creature to ignite into flame. Each round the
    target will suffer 2d6 points of fire damage.

    Hellfire Inferno

    The caster causes a target to ignite into flame. The target suffers a -4
    penalty to attack and damage rolls, and twice each round the target will
    suffer 2d6 points of fire damage and 1d6 points of divine damage.

    "NPC only spell for yaron

    like normal inferno but lasts only 5 rounds,
    ticks twice per round, adds attack and damage
    penalty."
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void DoCombustImpact(string sTag);
void DoInfernoImpact(string sTag);
void DoHellInfernoImpact(string sTag);

void main()
{
    if (DoSpellHook()) return;

    int nDice, nDiceSides, nDiceBonus;
    float fDelay = 0.0;
    int nDuration, nDurationType = ROUNDS;
    effect eLink = EffectVisualEffect(VFX_DUR_INFERNO_CHEST);

    switch (nSpellId)
    {
        case SPELL_COMBUST:
        {
            nDice = 2;
            nDiceSides = 6;
            nDiceBonus = min(10, nCasterLevel);
            nDuration = 10 + nCasterLevel;
        }
        break;
        case SPELL_INFERNO:
        {
            nDice = 2;
            nDiceSides = 6;
            fDelay = 0.75; // for Beam
            nDuration = nCasterLevel;

            // Apply beam as well
            ApplyBeamToObject(VFX_BEAM_FLAME, oTarget);
        }
        break;
        case SPELLABILITY_HELL_INFERNO:
        {
            fDelay = 0.75; // for Beam
            nDuration = nCasterLevel/2;
            eLink = EffectLinkEffects(EffectAttackDecrease(4),
                    EffectLinkEffects(EffectDamageDecrease(4, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                                      EffectVisualEffect(VFX_DUR_INFERNO_CHEST)));

            // Apply beam as well
            ApplyBeamToObject(VFX_BEAM_FLAME, oTarget);
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        if (!DoResistSpell(oTarget, oCaster))
        {
            if (nDice > 0 || nDiceBonus > 0)
            {
                int nDamage = GetDiceRoll(nDice, nDiceSides, nDiceBonus);

                DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, nDamage, DAMAGE_TYPE_FIRE));
            }
            // Apply with a tag so we can run multiple combustions at once
            string sTag = GetRandomUUID();
            eLink = TagEffect(eLink, sTag);
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nDuration, nDurationType) + 1.0));

            switch (nSpellId)
            {
                case SPELL_COMBUST:
                {
                    DelayCommand(6.0, DoCombustImpact(sTag));
                }
                break;
                case SPELL_INFERNO:
                {
                    DelayCommand(fDelay + 6.0, DoInfernoImpact(sTag));
                }
                break;
                case SPELLABILITY_HELL_INFERNO:
                {
                    DelayCommand(fDelay + 0.25, DoHellInfernoImpact(sTag));
                }
                break;
            }
        }
    }
}

void DoCombustImpact(string sTag)
{
    if (GetHasEffect(oTarget, EFFECT_TYPE_ALL, nSpellId, sTag))
    {
        int bSaved = DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_FIRE);

        if (!bSaved)
        {
            int nDamage = GetDamageBasedOnFeats(GetDiceRoll(1, 6, min(10, nCasterLevel)), oTarget, SAVING_THROW_REFLEX, bSaved);

            if (nDamage > 0)
            {
                ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, nDamage, DAMAGE_TYPE_FIRE);
            }
            DelayCommand(6.0, DoCombustImpact(sTag));
        }
        else
        {
            RemoveEffectsFromSpell(oTarget, SPELL_ANY, EFFECT_TYPE_ALL, sTag);
        }
    }
}

void DoInfernoImpact(string sTag)
{
    if (GetHasEffect(oTarget, EFFECT_TYPE_ALL, nSpellId, sTag))
    {
        int nDamage = GetDiceRoll(2, 6);

        ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, nDamage, DAMAGE_TYPE_FIRE);

        DelayCommand(6.0, DoInfernoImpact(sTag));
    }
}

void DoHellInfernoImpact(string sTag)
{
    if (GetHasEffect(oTarget, EFFECT_TYPE_ALL, nSpellId, sTag))
    {
        ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, GetDiceRoll(2, 6), DAMAGE_TYPE_FIRE);
        ApplyDamageToObject(oTarget, GetDiceRoll(1, 6), DAMAGE_TYPE_DIVINE);

        DelayCommand(3.0, DoHellInfernoImpact(sTag));
    }
}

