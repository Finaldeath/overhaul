//::///////////////////////////////////////////////
//:: Cure Wounds
//:: op_s_curewounds
//:://////////////////////////////////////////////
/*
    Cure Minor Wounds    4 healing
    Cure Light Wounds    1d8 + 1/caster level (max 5)
    Cure Moderate Wounds 2d8 + 1/caster level (max 10)
    Cure Serious Wounds  3d8 + 1/caster level (max 15)
    Cure Critical Wounds 4d8 + 1/caster level (max 20)
    Heal                 10 per caster level (max 150)

    Mass Cure Light Wounds
    1d8 Hit Points, +1 points per caster level up to a maximum of +25
    Mass Cure Moderate Wounds
    2d8 Hit Points, +1 points per caster level up to a maximum of +30
    Mass Cure Serious Wounds
    3d8 Hit Points, +1 points per caster level up to a maximum of +35
    Mass Cure Critical Wounds
    4d8 Hit Points, +1 points per caster level up to a maximum of +40

    Mass Heal
    All allies within the area of effect are restored by 10 hit points per
    caster level (maximum 250). Additionally it removes the following adverse
    conditions: ability damage, blinded, confused, dazed, dazzled, deafened,
    diseased, exhausted, fatigued, feebleminded, insanity, nauseated, sickened,
    stunned, and poisoned.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void HealOrHarm(object oTarget, int nVisHeal, int nVisHarm, int nDice, int nHealingStatic, int bAOE, int bDoTouch = FALSE);

void main()
{
    if (DoSpellHook()) return;

    // Apply Healing Domain metamagic (adds Empower)
    if (GetHasFeat(FEAT_HEALING_DOMAIN_POWER, oCaster, TRUE))
    {
        nMetaMagic = nMetaMagic | METAMAGIC_EMPOWER;
    }
    // * if low or normal difficulty is treated as MAXIMIZED
    if(GetIsPC(oTarget) && GetGameDifficulty() < GAME_DIFFICULTY_CORE_RULES)
    {
        nMetaMagic = nMetaMagic | METAMAGIC_MAXIMIZE;
    }

    int nVisHeal, nDice, nHealingStatic;
    int nVisHarm = VFX_IMP_SUNSTRIKE;
    switch(nSpellId)
    {
        case SPELL_CURE_MINOR_WOUNDS:
            nDice = 0;
            nHealingStatic = 4;
            nVisHeal = VFX_IMP_HEAD_HEAL;
        break;
        case SPELL_CURE_LIGHT_WOUNDS:
            nDice = 1;
            nHealingStatic = min(nCasterLevel, 5);
            nVisHeal = VFX_IMP_HEALING_S;
        break;
        case SPELL_CURE_MODERATE_WOUNDS:
            nDice = 2;
            nHealingStatic = min(nCasterLevel, 10);
            nVisHeal = VFX_IMP_HEALING_M;
        break;
        case SPELL_CURE_SERIOUS_WOUNDS:
            nDice = 3;
            nHealingStatic = min(nCasterLevel, 15);
            nVisHeal = VFX_IMP_HEALING_L;
        break;
        case SPELL_CURE_CRITICAL_WOUNDS:
            nDice = 4;
            nHealingStatic = min(nCasterLevel, 20);
            nVisHeal = VFX_IMP_HEALING_G;
        break;
        case SPELL_CURE_CRITICAL_WOUNDS_OTHER:
            nDice = 4;
            nHealingStatic = min(nCasterLevel, 20);
            nVisHeal = VFX_IMP_SUPER_HEROISM;
        break;
        case SPELL_HEAL:
            nDice = 0;
            nHealingStatic = min(nCasterLevel * 10, 150);
            nVisHeal = VFX_IMP_HEALING_X;
        break;
        case SPELL_HEALING_CIRCLE: /* SPELL_MASS_CURE_LIGHT_WOUNDS */
            nVisHeal = VFX_IMP_HEALING_S;
            nDice = 1;
            nHealingStatic = min(25, nCasterLevel);
        break;
        case SPELL_MASS_CURE_MODERATE_WOUNDS:
            nVisHeal = VFX_IMP_HEALING_M;
            nDice = 2;
            nHealingStatic = min(25, nCasterLevel);
        break;
        case SPELL_MASS_CURE_SERIOUS_WOUNDS:
            nVisHeal = VFX_IMP_HEALING_L;
            nDice = 2;
            nHealingStatic = min(25, nCasterLevel);
        break;
        case SPELL_MASS_CURE_CRITICAL_WOUNDS:
            nVisHeal = VFX_IMP_HEALING_G;
            nDice = 2;
            nHealingStatic = min(25, nCasterLevel);
        break;
        case SPELL_MASS_HEAL:
            nVisHeal = VFX_IMP_HEALING_X;
            nDice = 0;
            nHealingStatic = min(250, nCasterLevel * 10);
        break;
        default:
            OP_Debug("[Cure Wounds op_s_curewounds] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    // Cheat using the 2da info for if it is an AOE or not
    int bAOE = GetSpellIsAreaOfEffect(nSpellId);
    if (bAOE)
    {
        // Same AOE effect for each
        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_20), lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ANYTHING, SORT_METHOD_NONE, SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget, TRUE);

        // Mass heal gets touch attacks for balance
        int bTouch = nSpellId == SPELL_MASS_HEAL ? TRUE : FALSE;

        // Loop array
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/25.0;

            DelayCommand(fDelay, HealOrHarm(oTarget, nVisHeal, nVisHarm, nDice, nHealingStatic, TRUE, bTouch));
        }
    }
    else
    {
        HealOrHarm(oTarget, nVisHeal, nVisHarm, nDice, nHealingStatic, FALSE, TRUE);
    }
}

void HealOrHarm(object oTarget, int nVisHeal, int nVisHarm, int nDice, int nHealingStatic, int bAOE, int bDoTouch = FALSE)
{
    if (GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT)
    {
        // Just fire a non-hostile spell cast at for awareness
        SignalSpellCastAt(oTarget, oCaster, FALSE);

        // No effect. No feedback right now, maybe alter later.
        // FloatingTextStringOnCreature("*Healing spells cannot affect constructs*", oCaster, FALSE);
    }
    else if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
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
                    int nAmount = GetDiceRoll(nDice, 8, nHealingStatic);

                    // Double amount if critical
                    if (nTouch == 2) nAmount *= 2;

                    // Will saving throw for half
                    if (DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_POSITIVE))
                    {
                        nAmount /= 2;
                    }

                    // Cap Heal damage
                    if (nSpellId == SPELL_HEAL || nSpellId == SPELL_MASS_HEAL)
                    {
                        if (GetCurrentHitPoints(oTarget) - nAmount < 1) nAmount = GetCurrentHitPoints(oTarget) - 1;
                    }

                    effect eDamage = EffectDamage(nAmount, DAMAGE_TYPE_POSITIVE);
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

        int nAmount = GetDiceRoll(nDice, 8, nHealingStatic);

        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVisHeal), oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nAmount), oTarget);

        if (nSpellId == SPELL_HEAL ||
            nSpellId == SPELL_MASS_HEAL)
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
