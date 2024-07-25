//::///////////////////////////////////////////////
//:: AOE Effect
//:: op_s_aoeeffect.nss
//:://////////////////////////////////////////////
/*
    AOEs that do a particular effect. IE Saving throw or X.
    Make any effects ignore immunity since we do an nImmunity check. This stops
    people pausing and equipping an item that grants that immunity during
    gameplay.

    Balagarn's Iron Horn
    You create a deep, resonant vibration that can shake creatures off their
    feet as if they were being knocked over. If they are flying or floating
    they are immune to this effect.

    Make a single Strength check as if your Strength were 20. Creatures in the
    area make individual opposed Dexterity or Strength checks against your roll.
    Every creature that falls will be knocked down for one round.

    Wail of the Banshee
    The character emits a terrible scream that kills creatures that hear it
    (except for the character).

    All creatures that are not deaf or silenced within the area of effect must
    succeed at a Fortitude save or die, to a maximum of 1 enemy per caster level.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Optional damage?
    int nDamageType = -1, nDiceNum, nDiceSize;
    // Strength ability check result?
    int nStrengthCheckRoll = -1;
    // Saving throw and immunity?
    int nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nImmunity = IMMUNITY_TYPE_NONE, bImmuneIfFlying = FALSE, bImmuneIfCannotHear = FALSE;
    // Effect we apply on a failed save
    effect eLink;
    // If duration is 0.0 apply eLink instantly
    float fDuration = 0.0, fExtraDelay;
    // VFX
    int nImpact = VFX_NONE, nVis = VFX_NONE, nDamVis = VFX_NONE, bDelayRandom = FALSE;
    // Can change to selective hostile
    int nTargetType    = SPELL_TARGET_STANDARDHOSTILE;
    int nCreatureLimit = 99999;

    switch (nSpellId)
    {
        case SPELL_BALAGARNSIRONHORN:
        {
            nStrengthCheckRoll = d20() + 20;
            nImmunity          = IMMUNITY_TYPE_KNOCKDOWN;
            bImmuneIfFlying    = TRUE;
            nImpact            = VFX_FNF_SCREEN_SHAKE;
            nVis               = VFX_IMP_HEAD_NATURE;
            eLink              = EffectLinkEffects(IgnoreEffectImmunity(EffectKnockdown()),
                                                   EffectLinkEffects(EffectIcon(EFFECT_ICON_KNOCKDOWN),
                                                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            fDuration          = 6.0;
        }
        break;
        case SPELL_WAIL_OF_THE_BANSHEE:
        {
            nImmunity           = IMMUNITY_TYPE_DEATH;
            bImmuneIfCannotHear = TRUE;
            nSavingThrow        = SAVING_THROW_FORT;
            nSavingThrowType    = SAVING_THROW_TYPE_DEATH;
            nImpact             = VFX_FNF_WAIL_O_BANSHEES;
            nVis                = VFX_IMP_DEATH;
            eLink               = IgnoreEffectImmunity(EffectDeath());
            fDuration           = 0.0;
            fExtraDelay         = 3.0;
            nCreatureLimit      = nCasterLevel;
        }
        break;
        default:
            Debug("[op_s_aoeeffect] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = bDelayRandom ? GetRandomDelay(0.4, 1.75) : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        fDelay += fExtraDelay;

        if (nCreatureLimit > 0)
        {
            nCreatureLimit--;

            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity) &&
                    (!bImmuneIfFlying || !GetIsFlying(oTarget)) &&
                    (!bImmuneIfCannotHear || GetCanHear(oTarget)))
                {
                    // Saving throw or strength check?
                    int bSaved = FALSE;
                    if (nSavingThrow != -1)
                    {
                        bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);
                    }
                    else if (nStrengthCheckRoll != -1)
                    {
                        // Ability check
                        bSaved = DoAbiliyCheck(oTarget, oCaster, nStrengthCheckRoll, ABILITY_STRENGTH, ABILITY_DEXTERITY);
                    }

                    // Damage?
                    if (nDamageType != -1)
                    {
                        int nDamage = GetDiceRoll(nDiceNum, nDiceSize);

                        if (nSavingThrow == SAVING_THROW_REFLEX) nDamage = GetDamageBasedOnFeats(nDamage, oTarget, bSaved);

                        if (nDamage > 0)
                        {
                            if (nDamVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nDamVis, oTarget));
                            DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, nDamageType));
                        }
                    }

                    if (!bSaved)
                    {
                        if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                        if (fDuration == 0.0)
                        {
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget));
                        }
                        else
                        {
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                        }
                    }
                }
            }
        }
    }
}
