//::///////////////////////////////////////////////
//:: Shadowdancer Feat Abilities
//:: op_f_shadowdance
//:://////////////////////////////////////////////
/*
    Shadow Daze - Daze attack

    Shadow Evade - defensive bonuses

    Summon Shadow - clone of the caster (to do: remove spells/abilities)
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_creature"

effect GetShadowEvadeEffect(int nLevel);

void main()
{
    if (DoSpellHook()) return;

    switch (nSpellId)
    {
        case SPELL_SHADOW_DAZE:
        {
            // Simple Daze spell
            int nSavingThrow     = SAVING_THROW_WILL;
            int nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            int nDuration        = 2 + nCasterLevel;
            int nDurationType    = ROUNDS;
            effect eLink = EffectLinkEffects(EffectDazed(),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                SignalSpellCastAt();

                if (!DoResistSpell(oTarget, oCaster))
                {
                    if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType))
                    {
                        ApplyVisualEffectToObject(VFX_IMP_DAZED_S, oTarget);
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nDuration, nDurationType));
                    }
                }
            }
        }
        break;
        case SPELL_SHADOW_EVADE:
        {
            SignalSpellCastAt();

            effect eLink = GetShadowEvadeEffect(nCasterLevel);

            ApplyVisualEffectToObject(VFX_IMP_SUPER_HEROISM, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(5, ROUNDS));
        }
        break;
        case SPELL_SUMMON_SHADOW:
        {
            SignalSpellCastAt();

            float fDuration = GetDuration(nCasterLevel * 3, ROUNDS);

            // Simple clone for now
            object oClone = CreateDoppleganger(oCaster, GetLocation(oCaster), STANDARD_FACTION_HOSTILE);

            // Apply HP and get bonus effect
            effect eBonus;
            if (GetHasFeat(FEAT_EPIC_EPIC_SHADOWLORD, oCaster))
            {
                // Bonuses from Shadow Evade. For now fake it.
                eBonus = GetShadowEvadeEffect(nCasterLevel);
                // Better duration
                fDuration = GetDuration(nCasterLevel, HOURS);
            }
            else
            {
                int nConceal;
                if (nCasterLevel <= 5)
                {
                    nConceal = 10;
                    SetCurrentHitPoints(oClone, GetMaxHitPoints(oCaster)/2);
                }
                else if (nCasterLevel <= 8)
                {
                    nConceal = 20;
                    SetCurrentHitPoints(oClone, GetMaxHitPoints(oCaster) * 3 / 4);
                }
                else
                {
                    nConceal = 30;
                    SetCurrentHitPoints(oClone, GetMaxHitPoints(oCaster));
                }
                eBonus = EffectLinkEffects(EffectConcealment(nConceal),
                                           EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR));
            }

            ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eBonus, oClone);

            // Clone summon
            effect eSummon = ExtraordinaryEffect(EffectSummonCreature("", VFX_FNF_SUMMON_UNDEAD, 0.0, 0, VFX_IMP_UNSUMMON, oClone));

            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSummon, oCaster, fDuration);
        }
        break;
    }
}

/*
    Shadowdancer Level - Bonus
    4 - 20% concealment, 10/+2 damage reduction, +2 Dodge AC
    6 - 30% concealment, 10/+3 damage reduction, +3 Dodge AC
    8 - 40% concealment, 10/+4 damage reduction, +4 Dodge AC
    10 - 50% concealment, 10/+5 damage reduction, +5 Dodge AC
    15 - 50% concealment, 15/+6 damage reduction, +6 Dodge AC
    20 - 50% concealment, 20/+7 damage reduction, +7 Dodge AC
    25 - 50% concealment, 25/+8 damage reduction, +8 Dodge AC
    30 - 50% concealment, 30/+9 damage reduction, +9 Dodge AC
*/
effect GetShadowEvadeEffect(int nLevel)
{
    // Defaults are highest level
    int nConceal, nDRAmount, nDRPower, nAC;

    if (nLevel >= 30)
    {
        nConceal = 50;
        nDRAmount = 30;
        nDRPower = DAMAGE_POWER_PLUS_NINE;
        nAC = 9;
    }
    else if (nLevel >= 25)
    {
        nConceal = 50;
        nDRAmount = 25;
        nDRPower = DAMAGE_POWER_PLUS_EIGHT;
        nAC = 8;
    }
    else if (nLevel >= 20)
    {
        nConceal = 50;
        nDRAmount = 20;
        nDRPower = DAMAGE_POWER_PLUS_SEVEN;
        nAC = 7;
    }
    else if (nLevel >= 15)
    {
        nConceal = 50;
        nDRAmount = 15;
        nDRPower = DAMAGE_POWER_PLUS_SIX;
        nAC = 6;
    }
    else if (nLevel >= 10)
    {
        nConceal = 50;
        nDRAmount = 10;
        nDRPower = DAMAGE_POWER_PLUS_FIVE;
        nAC = 5;
    }
    else if (nLevel >= 8)
    {
        nConceal = 40;
        nDRAmount = 10;
        nDRPower = DAMAGE_POWER_PLUS_FOUR;
        nAC = 4;
    }
    else if (nLevel >= 6)
    {
        nConceal = 30;
        nDRAmount = 10;
        nDRPower = DAMAGE_POWER_PLUS_THREE;
        nAC = 3;
    }
    else // 1-5
    {
        nConceal = 20;
        nDRAmount = 10;
        nDRPower = DAMAGE_POWER_PLUS_TWO;
        nAC = 2;
    }

    effect eLink = EffectLinkEffects(EffectConcealment(nConceal),
                           EffectLinkEffects(EffectDamageReduction(nDRAmount, nDRPower),
                           EffectLinkEffects(EffectACIncrease(nAC, AC_DODGE_BONUS),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE),
                                             EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR)))));

    eLink = ExtraordinaryEffect(eLink);

    return eLink;
}
