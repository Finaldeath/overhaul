//::///////////////////////////////////////////////
//:: Combust and Inferno
//:: op_s_combust
//:://////////////////////////////////////////////
/*
    This spell makes a creature burst into flame. The initial eruption of flame
    causes 2d6 fire damage +1 point per caster level (maximum +10) with no
    saving throw. Further, the creature must make a Reflex save or catch fire
    taking a further 1d6 +1 point per caster level (maximum +10) points of
    damage. This will continue until the Reflex save is made or the duration
    expires.

    Inferno

    The caster causes a target creature to ignite into flame. Each round the
    target will suffer 2d6 points of fire damage.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void DoCombustImpact(string sTag);
void DoInfernoImpact(string sTag);

void main()
{
    if (DoSpellHook()) return;

    int nDamage;
    float fDelay = 0.0;
    int nDuration, nDurationType = ROUNDS;

    switch (nSpellId)
    {
        case SPELL_COMBUST:
        {
            nDamage = GetDiceRoll(2, 6, min(10, nCasterLevel));
            nDuration = 10 + nCasterLevel;
        }
        break;
        case SPELL_INFERNO:
        {
            nDamage = GetDiceRoll(2, 6);
            fDelay = 0.75; // for Beam
            nDuration = nCasterLevel;

            // Apply beam as well
            ApplyBeamToObject(VFX_BEAM_FLAME, oTarget);
        }
        break;
        default:
        {
            Debug("[op_s_combust] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        if (!DoResistSpell(oTarget, oCaster))
        {
            int nDamage = GetDiceRoll(2, 6, min(10, nCasterLevel));

            if (nDamage > 0)
            {
                DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, nDamage, DAMAGE_TYPE_FIRE));
            }
            // Apply with a tag so we can run multiple combustions at once
            string sTag = GetRandomUUID();
            effect eCombust = TagEffect(EffectVisualEffect(VFX_DUR_INFERNO_CHEST), sTag);
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eCombust, oTarget, GetDuration(nDuration, nDurationType) + 1.0));

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

