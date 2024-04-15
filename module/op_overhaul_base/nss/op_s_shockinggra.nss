//::///////////////////////////////////////////////
//:: Shocking Grasp
//:: op_s_shockinggra.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard / Sorcerer 1
    Innate Level: 1
    School: Transmutation
    Descriptor(s): Electricity
    Component(s): Verbal, Somatic
    Range: Touch
    Area of Effect / Target: Single
    Duration: Instant
    Additional Counter Spells:
    Save: None
    Spell Resistance: Yes

    The character's successful melee touch attack deals 1d8 points of electrical
    damage +1 point per caster level (maximum +20). When delivering the jolt,
    the character gains a +3 attack bonus if the opponent is wearing metal armor
    (AC 4 or above), or made out of metal such as a Iron Golem.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt(oTarget, oCaster, TRUE);

        int bBonus = FALSE;

        // If metal armor we apply a bonus.
        object oChest = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);
        if (GetIsObjectValid(oChest))
        {
            if (GetArmorBaseACValue(oChest) >= 4)
            {
                bBonus = TRUE;
            }
        }
        // If a metal creature we also apply the bonus
        if (GetIsMetalCreature(oTarget))
        {
            bBonus = TRUE;
        }

        if (bBonus)
        {
            // Apply the bonus, a brief amount of attack bonus
            effect eAttackBonus = EffectAttackIncrease(3, ATTACK_BONUS_MISC);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eAttackBonus, oCaster, 0.5);
        }

        // Do the touch attack
        int nTouchAttack = DoTouchAttack(oTarget, oCaster, TOUCH_MELEE);
        if (nTouchAttack)
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                int nBonusDamage = min(nCasterLevel, 20);
                int nDamage = GetDiceRoll(1, 8, nBonusDamage);

                // Critical roll
                if (nTouchAttack == 2) nDamage *= 2;

                effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
                effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);

                DelayCommand(0.0, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                DelayCommand(0.0, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
            }
        }
    }
}

