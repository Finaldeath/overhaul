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
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

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

    int nAmount, nVisHeal;
    int nVisDamage = VFX_IMP_SUNSTRIKE;
    switch(nSpellId)
    {
        case SPELL_CURE_MINOR_WOUNDS:
            nAmount = 4;
            nVisHeal = VFX_IMP_HEAD_HEAL;
        break;
        case SPELL_CURE_LIGHT_WOUNDS:
            GetDiceRoll(1, 8, min(nCasterLevel, 5));
            nVisHeal = VFX_IMP_HEALING_S;
        break;
        case SPELL_CURE_MODERATE_WOUNDS:
            GetDiceRoll(2, 8, min(nCasterLevel, 10));
            nVisHeal = VFX_IMP_HEALING_M;
        break;
        case SPELL_CURE_SERIOUS_WOUNDS:
            GetDiceRoll(3, 8, min(nCasterLevel, 15));
            nVisHeal = VFX_IMP_HEALING_L;
        break;
        case SPELL_CURE_CRITICAL_WOUNDS:
            GetDiceRoll(4, 8, min(nCasterLevel, 20));
            nVisHeal = VFX_IMP_HEALING_G;
        break;
        case SPELL_CURE_CRITICAL_WOUNDS_OTHER:
            GetDiceRoll(4, 8, min(nCasterLevel, 20));
            nVisHeal = VFX_IMP_SUPER_HEROISM;
        break;
        case SPELL_HEAL:
            nAmount = min(nCasterLevel * 10, 150);
            nVisHeal = VFX_IMP_HEALING_X;
        break;
    }

    if (GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT)
    {
        SignalSpellCastAt();

        // No effect
        FloatingTextStringOnCreature("*Healing spells cannot affect constructs*", oCaster, FALSE);
    }
    else if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
    {
        // Damage
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_MELEE);
            if (nTouch)
            {
                if (!DoResistSpell(oTarget, oCaster))
                {
                    // Double amount if critical
                    if (nTouch == 2) nAmount *= 2;

                    effect eDamage = EffectDamage(nAmount, DAMAGE_TYPE_POSITIVE);
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVisDamage), oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                }
            }
        }
    }
    else
    {
        // Heal
        SignalSpellCastAt(oTarget, oCaster, FALSE);

        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVisHeal), oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nAmount), oTarget);

        if (nSpellId == SPELL_HEAL)
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

