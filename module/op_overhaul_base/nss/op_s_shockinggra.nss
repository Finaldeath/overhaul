//::///////////////////////////////////////////////
//:: Shocking Grasp
//:: op_s_shockinggra.nss
//:://////////////////////////////////////////////
/*
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
#include "x0_i0_position"

void main()
{
    if (DoSpellHook()) return;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

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
            // Apply the bonus, which shouldn't then apply outside this spell.
            effect eAttackBonus = EffectAttackIncrease(3, ATTACK_BONUS_MISC);
            eAttackBonus = HideEffectIcon(eAttackBonus);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eAttackBonus, oCaster, 0.0);
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
        else
        {
            // We miss by firing the VFX as missed
            effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S, TRUE);
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

            // TODO better way would be to generate a new location between the two creatures
/*

            //location lAhead = GenerateNewLocation(oCaster, 1.5, GetFacing(oCaster), GetFacing(oCaster));

            vector vCaster = GetPosition(oCaster);
            vector vTarget = GetPosition(oTarget);
            vector vDiff = Vector((vTarget.x + vCaster.x) / 2.0, (vTarget.y + vCaster.y) / 2.0, (vTarget.z + vCaster.z) / 2.0);
            vDiff = vDiff - vTarget;

            //vector vDiff = GetPosition(oTarget) - GetPosition(oCaster);
            //vDiff = Vector(vDiff.x/2, vDiff.y/2, vDiff.z/2);

            vector vNormalized = VectorNormalize(vDiff);

            SpeakString("vCaster: " + VectorToString(vCaster) + " vTarget: " + VectorToString(vTarget));
            SpeakString("vDiff: " + VectorToString(vDiff) + " vNormalized: " + VectorToString(vNormalized));

            //vector vTranslate = Vector(GetRandomDelay(0.5, 1.0), GetRandomDelay(0.5, 1.0), 0.0);

            effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S, FALSE, 1.0, vDiff);
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
*/
        }
    }
}

