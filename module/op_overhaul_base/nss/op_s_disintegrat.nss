//::///////////////////////////////////////////////
//:: Disintegrate
//:: op_s_disintegrat.nss
//:://////////////////////////////////////////////
/*
    A ray springs from the character's pointing finger. You must make a
    successful ranged touchattack to hit. Any object struck by the ray takes 2d6
    points of magical damage per caster level (to a maximum of 40d6). Any object
    reduced to 0 or fewer hit points by this spell is entirely disintegrated,
    leaving behind only a trace of fine dust.

    A creature or object that makes a successful Fortitude save is partially
    affected, taking only 5d6 points of damage. If this damage reduces the
    creature or object to 0 or fewer hit points, it is entirely disintegrated.

    ---------

    Note this spell tries to stay non-disruptive to modules:
    - Creatures are killed with EffectDeath()
    - They'll turn into dust (change of appearance) and be set to not be raiseable
    - PCs and Henchmen just get the VFX they won't get turned to dust. I guess
      we could do it and when raised in a script change them back though.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void ApplyDisintegrate(object oTarget, int nDamage);

void main()
{
    if (DoSpellHook()) return;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);
        if (nTouch)
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                int nDamage;
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC))
                {
                    // Limit damage to 40d6
                    int nDamageDice = min(nCasterLevel * 2, 40);
                    nDamage         = GetDiceRoll(nDamageDice, 6);

                    // Critical hit?
                    if (nTouch == 2) nDamage *= 2;
                }
                else
                {
                    nDamage = GetDiceRoll(5, 6);
                    // Critical hit?
                    if (nTouch == 2) nDamage *= 2;
                }

                // Apply the damage after a short delay, then test if they're dead from it
                DelayCommand(0.0, ApplyDisintegrate(oTarget, nDamage));
            }
        }
        else
        {
            // Miss beam
            effect eRay = EffectBeam(VFX_BEAM_DISINTEGRATE, oCaster, BODY_NODE_HAND, TRUE);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget, 1.5);
        }
    }
}

void ApplyDisintegrate(object oTarget, int nDamage)
{
    // Ahgggh annoyingly PermanentDeath isn't a settable flag in nwscript

    // New simpler way is to have us test if the death will happen and if it will we use
    // fake damage messages + DestroyObject

    // If already dead NPC just apply the beam
    if (GetIsDead(oTarget) && !GetIsPC(oTarget))
    {
        effect eRay = UnyieldingEffect(EffectBeam(VFX_BEAM_DISINTEGRATE, oCaster, BODY_NODE_HAND));
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget, 1.5);
    }
    // Note the spell will kill when people reach 0 HP so this covers dying anyway
    else if (GetCurrentHitPoints(oTarget) - nDamage <= 0 &&
             !GetPlotFlag(oTarget) &&
             !GetImmortal(oTarget))
    {
        // Fake damage message (maybe...)
        SendFakeDamageFeedbackMessage(oTarget, oCaster, nDamage, DAMAGE_TYPE_MAGICAL);

        // Scale of VFX based off target
        float fScale = GetVFXScale(oTarget);

        // Dust effect
        effect eVis = EffectVisualEffect(30000, FALSE, fScale);
        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oTarget));

        effect eRay = UnyieldingEffect(EffectBeam(VFX_BEAM_DISINTEGRATE, oCaster, BODY_NODE_HAND));
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget, 1.5);

        // If PC or henchman we just kill them
        if (GetIsPC(oTarget) || GetAssociateType(oTarget) == ASSOCIATE_TYPE_HENCHMAN)
        {
            effect eDeath = IgnoreEffectImmunity(EffectDeath());
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);
        }
        else
        {
            // Set to be corpse lootable for the dust to work well, no way to set the bodybag
            // which would be more optimal. We are not allowing resurrections however.
            SetLootable(oTarget, TRUE);
            SetIsDestroyable(FALSE, FALSE, TRUE, oTarget);

            // Make it stuck in place and stoney it before we make it dust (keeps it in the VFX area)
            effect ePetrify = EffectPetrify();
            ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, ePetrify, oTarget);

            // They will become a dust plume!
            DelayCommand(1.0, SetCreatureAppearanceType(oTarget, APPEARANCE_TYPE_OP_DISINTEGRATE_DUST_PLUME));

            // Apply death (trigger scripts)
            effect eDeath = IgnoreEffectImmunity(EffectDeath(FALSE));
            DelayCommand(1.5, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
        }
    }
    else
    {
        // Didn't kill, just apply normal damage and a minor VFX
        effect eRay = UnyieldingEffect(EffectBeam(VFX_BEAM_DISINTEGRATE, oCaster, BODY_NODE_HAND));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget, 1.5);

        effect eVis    = EffectVisualEffect(VFX_IMP_MAGBLUE);
        effect eDamage = EffectDamage(nDamage);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
    }
}
