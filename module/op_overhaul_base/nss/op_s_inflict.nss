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

void HarmOrHeal(object oTarget, int nVisHeal, int nVisHarm, int nDice, int nStatic, int bAOE, int bDoTouch = FALSE);

void main()
{
    if (DoSpellHook()) return;

    // TODO better VFX not reusing the heal ones

    int nVisHeal, nVisHarm, nDice, nStatic;
    switch(nSpellId)
    {
        case SPELL_INFLICT_MINOR_WOUNDS:
            nDice = 0;
            nStatic = 4;
            nVisHeal = VFX_IMP_HEAD_HEAL;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_INFLICT_LIGHT_WOUNDS:
            nDice = 1;
            nStatic = min(nCasterLevel, 5);
            nVisHeal = VFX_IMP_HEALING_S;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_INFLICT_MODERATE_WOUNDS:
            nDice = 2;
            nStatic = min(nCasterLevel, 10);
            nVisHeal = VFX_IMP_HEALING_M;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_INFLICT_SERIOUS_WOUNDS:
            nDice = 3;
            nStatic = min(nCasterLevel, 15);
            nVisHeal = VFX_IMP_HEALING_L;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_INFLICT_CRITICAL_WOUNDS:
            nDice = 4;
            nStatic = min(nCasterLevel, 20);
            nVisHeal = VFX_IMP_HEALING_G;
            nVisHarm = VFX_IMP_NEGATIVE_ENERGY;
        break;
        case SPELL_HARM:
        case SPELLABILITY_HARM_SELF:
            nDice = 0;
            nStatic = min(nCasterLevel * 10, 150);
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
            OP_Debug("[Inflict Wounds op_s_inflict] No valid spell ID passed in: " + IntToString(nSpellId) + " name: " + GetSpellName(nSpellId));
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

    // Cheat using the 2da info for if it is an AOE or not
    int bAOE = GetSpellIsAreaOfEffect(nSpellId);
    if (bAOE)
    {
        // Same AOE effect for each
        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_20), lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ANYTHING, SORT_METHOD_NONE, SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget, TRUE);

        // Mass heal gets touch attacks for balance
        int bTouch = FALSE; // nSpellId == SPELL_MASS_HEAL ? TRUE : FALSE;

        // Loop array
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/25.0;

            DelayCommand(fDelay, HarmOrHeal(oTarget, nVisHeal, nVisHarm, nDice, nStatic, TRUE, bTouch));
        }
    }
    else
    {
        HarmOrHeal(oTarget, nVisHeal, nVisHarm, nDice, nStatic, FALSE, TRUE);
    }
}

void HarmOrHeal(object oTarget, int nVisHeal, int nVisHarm, int nDice, int nStatic, int bAOE, int bDoTouch = FALSE)
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
                if (!DoResistSpell(oTarget, oCaster))
                {
                    int nAmount = GetDiceRoll(nDice, 8, nStatic);

                    // Double amount if critical
                    if (nTouch == 2) nAmount *= 2;

                    // Will saving throw for half
                    if (DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_NEGATIVE))
                    {
                        nAmount /= 2;
                    }

                    // Cap Heal damage
                    if (nSpellId == SPELL_HARM || nSpellId == SPELLABILITY_HARM_SELF)
                    {
                        if (GetCurrentHitPoints(oTarget) - nAmount < 1) nAmount = GetCurrentHitPoints(oTarget) - 1;
                    }

                    effect eDamage = EffectDamage(nAmount, DAMAGE_TYPE_NEGATIVE);
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVisHarm), oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
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
