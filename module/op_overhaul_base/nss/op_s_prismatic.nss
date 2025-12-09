//:://////////////////////////////////////////////
//:: Prismatic type spells
//:: op_s_prismatic
//:://////////////////////////////////////////////
/*
    Random effects or based off HD.

    Color Spray
    Color Spray sends forth a dazzling array of lights to confound all creatures
    within the area of effect. Its effects vary according to the Hit Dice of the
    affected creatures:
    1-2 HD: Sleep for 3 + 1d4 rounds
    3-4 HD: Blinded for 2 + 1d4 rounds
    Over 4 HD: Stunned for 1 + 1d4 rounds

    Prismatic Spray
    All creatures within the area of effect randomly experience one of the
    following effects on the basis of a 1d8 roll:

    1 - 20 fire damage (Reflex 1/2)
    2 - 40 acid damage (Reflex 1/2)
    3 - 80 electrical damage (Reflex 1/2)
    4 - Struck with Bebilith Venom poison (Fortitude DC 20 to negate)
    5 - Paralyzed for 10 rounds (Fortitide to negate)
    6 - Confused for 10 rounds (Will vs. mind-affecting to negate)
    7 - Struck dead (Will vs. death magic to negate)
    8 - 2 effects from the above list are rolled.

    Additionally, any creature with 8 hit dice or less is blinded for one round
    per caster level with no chance no save.

    Prismatic Breath
    TBC

    Dragon Breath, Prismatic
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void ApplyColorSpray(float fDelay);
void ApplyPrismaticSpray(float fDelay, int nMaxRoll = 8);

const int PRISMATIC   = 1;
const int COLOR_SPRAY = 2;

void main()
{
    if (DoSpellHook()) return;

    int nType = PRISMATIC;
    int bResistSpell = TRUE;

    switch (nSpellId)
    {
        case SPELL_PRISMATIC_SPRAY:
        {
            nType = PRISMATIC;
        }
        break;
        case SPELL_COLOR_SPRAY:
        {
            nType = PRISMATIC;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_PRISMATIC:
        {
            nType = PRISMATIC;
            nSpellSaveDC = GetHitDice(oCaster);
            bResistSpell = FALSE;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), GetLocation(oCaster)) / 20.0;

        if (!bResistSpell || !DoResistSpell(oTarget, oCaster, fDelay))
        {
            switch (nType)
            {
                case PRISMATIC:
                {
                    ApplyPrismaticSpray(fDelay);
                }
                break;
                case COLOR_SPRAY:
                {
                    ApplyColorSpray(fDelay);
                }
                break;
            }
        }
    }
}

void ApplyColorSpray(float fDelay)
{
    if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_MIND_SPELLS))
    {
        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
        {
            int nHD = GetHitDice(oTarget);
            /*
                1-2 HD: Sleep for 3 + 1d4 rounds
                3-4 HD: Blinded for 2 + 1d4 rounds
                Over 4 HD: Stunned for 1 + 1d4 rounds
            */
            if(nHD <= 2)
            {
                effect eLink = GetEffectLink(EFFECT_TYPE_SLEEP);
                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_SLEEP, oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(3 + d4())));
            }
            else if(nHD <= 4)
            {
                effect eLink   = GetEffectLink(EFFECT_TYPE_STUNNED);
                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_STUN, oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(2 + d4())));
            }
            else
            {
                effect eLink = GetEffectLink(EFFECT_TYPE_BLINDNESS);
                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_BLIND_DEAF_M, oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(1 + d4())));
            }
        }
    }
}

void ApplyPrismaticSpray(float fDelay, int nMaxRoll = 8)
{
    if (nMaxRoll == 8 && GetHitDice(oTarget) <= 8)
    {
        effect eLink = EffectLinkEffects(EffectBlindness(),
                       EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                                         EffectRunScriptEnhanced(FALSE, "op_rs_removespel")));
        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nCasterLevel)));
    }

    // Note: For dispel purposes the effects are linked to a run script so any
    // other effects are also removed, except the poison.
/*
    1 - 20 fire damage (Reflex 1/2)
    2 - 40 acid damage (Reflex 1/2)
    3 - 80 electrical damage (Reflex 1/2)
    4 - Struck with Bebilith Venom poison (Fortitude DC 20 to negate)
    5 - Paralyzed for 10 rounds (Fortitide to negate)
    6 - Confused for 10 rounds (Will vs. mind-affecting to negate)
    7 - Struck dead (Will vs. death magic to negate)
    8 - 2 effects from the above list are rolled.

    Additionally, any creature with 8 hit dice or less is blinded for one round per caster level with no chance no save.
*/
    int nRoll = Random(nMaxRoll) + 1;
    switch (nRoll)
    {
        case 1:
        {
            int nDamage = DoDamageSavingThrow(20, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_FIRE, fDelay);
            if (nDamage > 0)
            {
                DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, nDamage, DAMAGE_TYPE_FIRE));
            }
        }
        break;
        case 2:
        {
            int nDamage = DoDamageSavingThrow(40, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_ACID, fDelay);
            if (nDamage > 0)
            {
                DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_ACID_S, nDamage, DAMAGE_TYPE_ACID));
            }
        }
        break;
        case 3:
        {
            int nDamage = DoDamageSavingThrow(80, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_ELECTRICITY, fDelay);
            if (nDamage > 0)
            {
                DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_LIGHTNING_S, nDamage, DAMAGE_TYPE_ELECTRICAL));
            }
        }
        break;
        case 4:
        {
            effect ePoison = SupernaturalEffect(EffectPoison(POISON_BEBILITH_VENOM));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoison, oTarget));
        }
        break;
        case 5:
        {
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_PARALYSIS))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_PARALYSIS, fDelay))
                {
                    effect eLink = EffectLinkEffects(GetEffectLink(EFFECT_TYPE_PARALYZE),
                                                     EffectRunScriptEnhanced(FALSE, "op_rs_removespel"));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(10)));
                }
            }
        }
        break;
        case 6:
        {
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_CONFUSED) &&
                !GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_MIND_SPELLS))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                {
                    effect eLink = EffectLinkEffects(GetEffectLink(EFFECT_TYPE_CONFUSED),
                                                     EffectRunScriptEnhanced(FALSE, "op_rs_removespel"));
                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_CONFUSION_S, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(10)));
                }
            }
        }
        break;
        case 7:
        {
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_DEATH))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_DEATH, fDelay))
                {
                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_DEATH, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget));
                }
            }
        }
        break;
        case 8:
        {
            ApplyPrismaticSpray(fDelay, 7);
        }
        break;
    }
}

