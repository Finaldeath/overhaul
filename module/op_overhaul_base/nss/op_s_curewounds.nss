//:://////////////////////////////////////////////
//:: Cure Wound and Heal spells
//:: op_s_curewounds
//:://////////////////////////////////////////////
/*
    Cure Minor Wounds    4 healing
    Cure Light Wounds    1d8 + 1/caster level (max 5)
        Lesser Body Adjustment
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

    Lay on Hands
    With this feat, characters can heal damage equal to their class level multiplied by their Charisma modifier.
    When used against undead creatures, it is treated as a touch attack spell that delivers damage instead of healing.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void HealOrHarm(object oTarget, float fDelay, int nVisHeal, int nVisHarm, int nDice, int nStatic, int bAOE, int bDoTouch = FALSE);

void main()
{
    if (DoSpellHook()) return;

    // Apply Healing Domain metamagic (adds Empower) if cast by a class such as a
    // Cleric (not say using an item, spellability, feat, etc.)
    if (!GetIsObjectValid(oCastItem) &&
         nFeatId == FEAT_INVALID &&
         nCasterClass != CLASS_TYPE_INVALID &&
         GetHasDomain(oCaster, DOMAIN_HEALING, nCasterClass))
    {
        nMetaMagic = nMetaMagic | METAMAGIC_EMPOWER;
    }
    // * if low or normal difficulty is treated as MAXIMIZED
    if (GetIsPC(oTarget) && GetGameDifficulty() < GAME_DIFFICULTY_CORE_RULES)
    {
        nMetaMagic = nMetaMagic | METAMAGIC_MAXIMIZE;
    }

    int nVisHeal, nDice, nHealingStatic;
    int nVisHarm = VFX_IMP_SUNSTRIKE;
    switch (nSpellId)
    {
        case SPELL_CURE_MINOR_WOUNDS:
            nDice          = 0;
            nHealingStatic = 4;
            nVisHeal       = VFX_IMP_HEAD_HEAL;
            break;
        case SPELL_CURE_LIGHT_WOUNDS:
        case SPELLABILITY_LESSER_BODY_ADJUSTMENT:
            nDice          = 1;
            nHealingStatic = min(nCasterLevel, 5);
            nVisHeal       = VFX_IMP_HEALING_S;
            break;
        case SPELL_CURE_MODERATE_WOUNDS:
            nDice          = 2;
            nHealingStatic = min(nCasterLevel, 10);
            nVisHeal       = VFX_IMP_HEALING_M;
            break;
        case SPELL_CURE_SERIOUS_WOUNDS:
            nDice          = 3;
            nHealingStatic = min(nCasterLevel, 15);
            nVisHeal       = VFX_IMP_HEALING_L;
            break;
        case SPELL_CURE_CRITICAL_WOUNDS:
            nDice          = 4;
            nHealingStatic = min(nCasterLevel, 20);
            nVisHeal       = VFX_IMP_HEALING_G;
            break;
        case SPELLABILITY_CURE_CRITICAL_WOUNDS_OTHER:
            nDice          = 4;
            nHealingStatic = min(nCasterLevel, 20);
            nVisHeal       = VFX_IMP_SUPER_HEROISM;
            break;
        case SPELL_HEAL:
            nDice          = 0;
            nHealingStatic = min(nCasterLevel * 10, 150);
            nVisHeal       = VFX_IMP_HEALING_X;
            break;
        case SPELL_HEALING_CIRCLE: /* SPELL_MASS_CURE_LIGHT_WOUNDS */
            nVisHeal       = VFX_IMP_HEALING_S;
            nDice          = 1;
            nHealingStatic = min(25, nCasterLevel);
            break;
        case SPELL_MASS_CURE_MODERATE_WOUNDS:
            nVisHeal       = VFX_IMP_HEALING_M;
            nDice          = 2;
            nHealingStatic = min(25, nCasterLevel);
            break;
        case SPELL_MASS_CURE_SERIOUS_WOUNDS:
            nVisHeal       = VFX_IMP_HEALING_L;
            nDice          = 2;
            nHealingStatic = min(25, nCasterLevel);
            break;
        case SPELL_MASS_CURE_CRITICAL_WOUNDS:
            nVisHeal       = VFX_IMP_HEALING_G;
            nDice          = 2;
            nHealingStatic = min(25, nCasterLevel);
            break;
        case SPELL_MASS_HEAL:
            nVisHeal       = VFX_IMP_HEALING_X;
            nDice          = 0;
            nHealingStatic = min(250, nCasterLevel * 10);
            break;
        case SPELLABILITY_LAY_ON_HANDS:
        {
            int nChr = GetAbilityModifier(ABILITY_CHARISMA);
            if (nChr < 0) nChr = 0;

            int nLevel = GetLevelByClass(CLASS_TYPE_PALADIN) + GetLevelByClass(CLASS_TYPE_DIVINECHAMPION);

            nVisHeal       = VFX_IMP_HEALING_M;
            nDice          = 0;
            nHealingStatic = nLevel * nChr;
            if(nHealingStatic <= 0) nHealingStatic = 1;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        // Same AOE effect for each
        ApplyVisualEffectAtLocation(VFX_FNF_LOS_HOLY_20, lTarget);

        // Mass heal gets touch attacks for balance
        int bTouch = nSpellId == SPELL_MASS_HEAL ? TRUE : FALSE;

        json jArray = GetArrayOfTargets(SPELL_TARGET_ANYTHING);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 25.0;

            HealOrHarm(oTarget, fDelay, nVisHeal, nVisHarm, nDice, nHealingStatic, TRUE, bTouch);
        }
    }
    else
    {
        HealOrHarm(oTarget, 0.0, nVisHeal, nVisHarm, nDice, nHealingStatic, FALSE, TRUE);
    }
}

void HealOrHarm(object oTarget, float fDelay, int nVisHeal, int nVisHarm, int nDice, int nStatic, int bAOE, int bDoTouch = FALSE)
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
                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    int nDamage = GetDiceRoll(nDice, 8, nStatic);

                    // Double amount if critical
                    if (nTouch == TOUCH_RESULT_CRITICAL_HIT) nDamage *= 2;

                    // Will saving throw for half
                    nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_POSITIVE, fDelay);

                    if (nDamage > 0)
                    {
                        // Cap Heal damage
                        int bCapDamage = FALSE;
                        if (nSpellId == SPELL_HEAL || nSpellId == SPELL_MASS_HEAL)
                        {
                            bCapDamage = TRUE;
                        }
                        DelayCommand(fDelay, ApplyVisualEffectToObject(nVisHarm, oTarget));
                        DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_POSITIVE, DAMAGE_POWER_NORMAL, bCapDamage));
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

        // Any cure spell removes these
        CureEffectsFromSpell(oTarget, SPELL_SPIKE_GROWTH);

        if (nSpellId == SPELL_HEAL ||
            nSpellId == SPELL_MASS_HEAL)
        {
            // Additionally it removes the following adverse conditions affecting
            // the target: ability damage, blinded, confused, dazed, dazzled,
            // deafened, diseased, exhausted, fatigued, feebleminded, insanity,
            // nauseated, sickened, stunned, and poisoned.
            json jArray = JsonArray();

            // Todo explicitly: Dazzled, Exhusted, Fatigued, Feeblemind, Insanity, Anuseated, Sickened
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_ABILITY_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_BLINDNESS));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_CONFUSED));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DAZED));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DEAF));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DISEASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_STUNNED));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_POISON));

            CureEffects(oTarget, jArray, TRUE);

            // Also remove these specific spells
            CureEffectsFromSpell(oTarget, SPELL_FEEBLEMIND);
            CureEffectsFromSpell(oTarget, SPELL_INFESTATION_OF_MAGGOTS);
        }
    }
}
