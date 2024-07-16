//::///////////////////////////////////////////////
//:: Inflict Wounds / Harm
//:: op_s_inflict.nss
//:://////////////////////////////////////////////
/*
    Inflict Minor Wounds    4 healing
    Inflict Light Wounds    1d8 + 1/caster level (max 5)
    Inflict Moderate Wounds 2d8 + 1/caster level (max 10)
    Inflict Serious Wounds  3d8 + 1/caster level (max 15)
    Inflict Critical Wounds 4d8 + 1/caster level (max 20)
    Harm / Half Self        10 per caster level (max 150)

    Harm charges a subject with negative energy that deals 10 points of damage
    per caster level (to a maximum of 150 points at 15th level). If the creature
    successfully saves, harm deals half this amount, but it cannot reduce the
    target’s hit points to less than 1.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// Do Harm or Heal as needed
void HarmOrHeal(object oTarget, float fDelay, int nVisHeal, int nVisHarm, int nDice, int nStatic, int bAOE, int bDoTouch = FALSE);

void main()
{
    if (DoSpellHook()) return;

    // TDO: VAriants of nVisHarm and better nVisHeal for healing undead
    int nVisHeal, nVisHarm, nDice, nStatic;

    switch (nSpellId)
    {
        case SPELL_INFLICT_MINOR_WOUNDS:
            nDice =    0;
            nStatic =  4;
            nVisHeal = VFX_IMP_HEAD_HEAL;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_INFLICT_LIGHT_WOUNDS:
            nDice =    1;
            nStatic =  min(nCasterLevel, 5);
            nVisHeal = VFX_IMP_HEALING_S;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_INFLICT_MODERATE_WOUNDS:
            nDice =    2;
            nStatic =  min(nCasterLevel, 10);
            nVisHeal = VFX_IMP_HEALING_M;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_INFLICT_SERIOUS_WOUNDS:
            nDice =    3;
            nStatic =  min(nCasterLevel, 15);
            nVisHeal = VFX_IMP_HEALING_L;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_INFLICT_CRITICAL_WOUNDS:
            nDice =    4;
            nStatic =  min(nCasterLevel, 20);
            nVisHeal = VFX_IMP_HEALING_G;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_HARM:
        case SPELLABILITY_HARM_SELF:
            nDice =    0;
            nStatic =  min(nCasterLevel * 10, 150);
            nVisHeal = VFX_IMP_HEALING_X;
            nVisHarm = VFX_IMP_HARM;
        break;
        /*
        case SPELL_HEALING_CIRCLE:
            nVisHeal = VFX_IMP_HEALING_S;
            nDice = 1;
            nStatic = min(25, nCasterLevel);
        break;
        case SPELL_MASS_CURE_MODERATE_WOUNDS:
            nVisHeal = VFX_IMP_HEALING_M;
            nDice = 2;
            nStatic = min(25, nCasterLevel);
        break;
        case SPELL_MASS_CURE_SERIOUS_WOUNDS:
            nVisHeal = VFX_IMP_HEALING_L;
            nDice = 2;
            nStatic = min(25, nCasterLevel);
        break;
        case SPELL_MASS_CURE_CRITICAL_WOUNDS:
            nVisHeal = VFX_IMP_HEALING_G;
            nDice = 2;
            nStatic = min(25, nCasterLevel);
        break;
        case SPELL_MASS_HARM:
            nVisHeal = VFX_IMP_HEALING_X;
            nDice = 0;
            nStatic = min(250, nCasterLevel * 10);
        break;
        */
        default:
            Debug("[Inflict Wounds op_s_inflict] No valid spell ID passed in: " + IntToString(nSpellId) + " name: " + GetSpellName(nSpellId));
            return;
        break;
    }

    // Check targeting
    if (nSpellId == SPELLABILITY_HARM_SELF)
    {
        if (oTarget != oCaster)
        {
            FloatingTextStringOnCreature("Harm Self must be targeted on yourself.", oCaster, FALSE);
            return;
        }
    }

    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        // Same AOE effect for each
        ApplyVisualEffectAtLocation(VFX_FNF_LOS_HOLY_20, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ANYTHING);

        // Mass spells gets touch attacks for balance
        int bTouch = TRUE;

        // Loop array
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/25.0;

            HarmOrHeal(oTarget, fDelay, nVisHeal, nVisHarm, nDice, nStatic, TRUE, bTouch);
        }
    }
    else
    {
        HarmOrHeal(oTarget, 0.0, nVisHeal, nVisHarm, nDice, nStatic, FALSE, TRUE);
    }
}

void HarmOrHeal(object oTarget, float fDelay, int nVisHeal, int nVisHarm, int nDice, int nStatic, int bAOE, int bDoTouch = FALSE)
{
    if (GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT)
    {
        // Just fire a non-hostile spell cast at for awareness
        SignalSpellCastAt(oTarget, oCaster, FALSE);

        // No effect. No feedback right now, maybe alter later.
        // FloatingTextStringOnCreature("*Healing spells cannot affect constructs*", oCaster, FALSE);
    }
    else if (GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD)
    {
        // Damage only explict enemies (for single target we assume this is an accident)
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
        {
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            int nTouch = 1;
            if (bDoTouch)
            {
                nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_MELEE);
            }
            if (nTouch)
            {
                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    int nDamage = GetDiceRoll(nDice, 8, nStatic);

                    // Double amount if critical
                    if (nTouch == 2) nDamage *= 2;

                    // Will saving throw for half
                    nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_NEGATIVE, fDelay);

                    if (nDamage > 0)
                    {
                        // Cap Heal damage
                        int bCapDamage = FALSE;
                        if (nSpellId == SPELL_HARM || nSpellId == SPELLABILITY_HARM_SELF)
                        {
                            bCapDamage = TRUE;
                        }
                        DelayCommand(fDelay, ApplyVisualEffectToObject(nVisHarm, oTarget));
                        DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_NEGATIVE, DAMAGE_POWER_NORMAL, bCapDamage));
                    }
                }
            }
        }
    }
    else if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_ALLALLIES) || bAOE == FALSE)
    {
        // Heal
        SignalSpellCastAt(oTarget, oCaster, FALSE);

        int nAmount = GetDiceRoll(nDice, 8, nStatic);

        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVisHeal), oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nAmount), oTarget);

        if (nSpellId == SPELL_HARM ||
            nSpellId == SPELLABILITY_HARM_SELF)
        {
            // Additionally it removes the following adverse conditions affecting
            // the target: ability damage, blinded, confused, dazed, dazzled,
            // deafened, diseased, exhausted, fatigued, feebleminded, insanity,
            // nauseated, sickened, stunned, and poisoned.
            effect eCheck = GetFirstEffect(oTarget);
            while (GetIsEffectValid(eCheck))
            {
                switch (GetEffectType(eCheck, TRUE))
                {
                    case EFFECT_TYPE_ABILITY_DECREASE:
                    case EFFECT_TYPE_BLINDNESS:
                    case EFFECT_TYPE_CONFUSED:
                    case EFFECT_TYPE_DAZED:
                    // DAZZLED
                    case EFFECT_TYPE_DEAF:
                    case EFFECT_TYPE_DISEASE:
                    // EXHAUSTED (covered by ability decrease)
                    // FATIGUED (covered by ability decrease)
                    // SPELL_FEEBLEMIND (covered by ability decrease)
                    // INSANITY (covered by confusion)
                    // NAUSEATED (covered by ability decrease)
                    // SICKENED (covered by ability decrease)
                    case EFFECT_TYPE_STUNNED:
                    case EFFECT_TYPE_POISON:
                        RemoveEffect(oTarget, eCheck);
                    break;
                }
                eCheck = GetNextEffect(oTarget);
            }
        }
    }
}

