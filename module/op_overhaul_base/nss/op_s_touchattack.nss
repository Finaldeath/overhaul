//::///////////////////////////////////////////////
//:: Touch Attacks
//:: op_s_touchattack
//:://////////////////////////////////////////////
/*
    Touch Attack spells. Rays, touches, etc. Some are quite complicated but the
    common factor of a touch attack helps.

    Ice Dagger
    You create a piece of ice that flies toward the target and on a successful
    touch attack deals 1d4 points of cold damage per level (maximum of 5d4).
    Regardless ofif it hits, it does an additional 1 cold damage in a small
    area around the target.

    Shocking Grasp
    The character's successful melee touch attack deals 1d8 points of electrical
    damage +1 point per caster level (maximum +20). When delivering the jolt,
    the character gains a +3 attack bonus if the opponent is wearing metal
    armor (AC 4 or above), or made out of metal such as a Iron Golem.

    Searing light
    The character projects a blast of light from the character's open palm. The
    character must succeed at a ranged touch attack to strike the character's target.

    The divine damage inflicted is based on the target's racial type:
    Undead: 1d8 per caster level, to a maximum of 10d8
    Construct and inanimate objects: 1d6 for every 2 caster levels, to a maximum of 5d6
    Other: 1d8 per 2 caster levels, to a maximum of 5d8

    Healing Sting
    You inflict 1d12 points of negative damage +1 per caster level (maximum
    1d12+10) to the living creature on a successful melee touch attack, and
    gain an equal amount of hit points. You may not gain more Hit Points than
    your maximum with the Healing Sting.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nTouchAttackType = TOUCH_NONE;
    int nDice, nDiceSize, nStatic;
    int nBonusToHit = 0;
    // Saving throw and immunity?
    int nSavingThrow = SAVING_THROW_NONE, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nImmunity = IMMUNITY_TYPE_NONE;

    // Damage > 0 gets it saved
    int nDamageType;
    int bHeal = FALSE;

    // Effect to apply if target is hit.
    int bApplyEffect = FALSE;
    effect eLink;
    float fDuration;

    int nVis = VFX_NONE, nBeam = VFX_NONE;

    switch (nSpellId)
    {
        case SPELL_ICE_DAGGER:
        {
            nTouchAttackType = TOUCH_RANGED;
            nDice = min(5, nCasterLevel);
            nDiceSize = 4;
            nDamageType = DAMAGE_TYPE_COLD;
            nVis = VFX_IMP_FROST_S;
            // TODO: Maybe a beam visual attack or MIRV here
        }
        break;
        case SPELL_SHOCKING_GRASP:
        {
            // If a metal creature or in "Metal armor" (AC 4 or above)
            if (GetIsMetalCreature(oTarget) ||
                GetArmorBaseACValue(GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget)) >= 4)
            {
                nBonusToHit = 3;
            }

            nTouchAttackType = TOUCH_MELEE;
            nDice = 1;
            nDiceSize = 8;
            nStatic = min(nCasterLevel, 20);
            nDamageType = DAMAGE_TYPE_ELECTRICAL;
            nVis = VFX_IMP_LIGHTNING_S;
        }
        break;
        case SPELL_SEARING_LIGHT:
        {
            // Default damage for inanimate and constructs
            nDice = min(nCasterLevel/2, 5);
            nDiceSize = 6;

            if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
            {
                if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
                {
                    nDice = min(nCasterLevel, 10);
                    nDiceSize = 8;
                }
                else if (GetRacialType(oTarget) != RACIAL_TYPE_CONSTRUCT)
                {
                    nDice = min(nCasterLevel/2, 5);
                    nDiceSize = 8;
                }
            }

            nTouchAttackType = TOUCH_RANGED;
            nDamageType = DAMAGE_TYPE_DIVINE;
            nVis = VFX_IMP_SUNSTRIKE;
            nBeam = VFX_BEAM_HOLY;
        }
        break;
        case SPELL_HEALING_STING:
        {
            nTouchAttackType = TOUCH_MELEE;
            nDice = 1;
            nDiceSize = 12;
            nStatic = min(nCasterLevel, 10);
            nDamageType = DAMAGE_TYPE_NEGATIVE;
            nVis = VFX_IMP_NEGATIVE_ENERGY;
            bHeal = TRUE;
        }
        break;
        default:
            Debug("[op_s_touchattack] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    int bResist;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        if (nBonusToHit > nBonusToHit)
        {
            // Apply the bonus, which shouldn't then apply outside this spell, I hope.
            effect eAttackBonus = EffectAttackIncrease(nBonusToHit, ATTACK_BONUS_MISC);
            eAttackBonus        = HideEffectIcon(eAttackBonus);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAttackBonus, oCaster, 0.0);
        }

        int nTouch = DoTouchAttack(oTarget, oCaster, nTouchAttackType);

        if (nTouch)
        {
            ApplyBeamToObject(nBeam, oTarget);

            bResist = DoResistSpell(oTarget, oCaster);

            if (!bResist)
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
                {
                    int bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType);

                    if (nDice > 0 || nStatic > 0)
                    {
                        int nDamage = GetDiceRoll(nDice, nDiceSize, nStatic);

                        if (nTouch == TOUCH_RESULT_CRITICAL_HIT) nDamage *= 2;

                        nDamage = GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);

                        if (nDamage > 0)
                        {
                            if (bHeal)
                            {
                                ApplyDamageWithVFXToObjectAndDrain(oTarget, oCaster, nVis, nDamage, nDamageType);
                            }
                            else
                            {
                                ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, nDamageType);
                            }
                        }
                    }
                    if (bApplyEffect && !bSaved)
                    {
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                    }
                }
            }
        }
        else
        {
            if (nBeam)
            {
                ApplyBeamToObject(nBeam, oTarget, TRUE);
            }
            else
            {
                ApplyVisualEffectToObject(nVis, oTarget, TRUE);
            }
        }
    }
    // Ice Dagger extra bonus damage AOE
    if (nSpellId == SPELL_ICE_DAGGER)
    {
        // Regardless of hit or miss we do 1 cold damage in the area of effect
        json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_DOOR);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            object oAOETarget = GetArrayObject(jArray, nIndex);

            float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

            if (oAOETarget == oTarget)
            {
                if (bResist == FALSE)
                {
                    DelayCommand(fDelay, ApplyDamageToObject(oAOETarget, 1, DAMAGE_TYPE_COLD));
                }
            }
            else if (!DoResistSpell(oAOETarget, oCaster, fDelay))
            {
                SignalSpellCastAt(oAOETarget);
                DelayCommand(fDelay, ApplyDamageWithVFXToObject(oAOETarget, nVis, 1, DAMAGE_TYPE_COLD));
            }
        }
    }
}

