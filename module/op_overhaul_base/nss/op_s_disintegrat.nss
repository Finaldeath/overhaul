//::///////////////////////////////////////////////
//:: Disintegrate
//:: op_s_disintegrat.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard / Sorcerer 7
    Innate Level: 7
    School: Transmutation
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Medium
    Area of Effect / Target: Single
    Duration: Instant
    Additional Counter Spells:
    Save: Fortitude partial
    Spell Resistance: Yes

    A ray springs from the character's pointing finger. You must make a
    successful ranged touchattack to hit. Any object struck by the ray takes 2d6
    points of magical damage per caster level (to a maximum of 40d6). Any object
    reduced to 0 or fewer hit points by this spell is entirely disintegrated,
    leaving behind only a trace of fine dust.

    A creature or object that makes a successful Fortitude save is partially
    affected, taking only 5d6 points of damage. If this damage reduces the
    creature or object to 0 or fewer hit points, it is entirely disintegrated.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void ApplyDisintegrate(object oTarget, int nDamage);
void DestroyThem(object oTarget);

void main()
{
    if (DoSpellHook()) return;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
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
                    nDamage = GetDiceRoll(nDamageDice, 6);

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
        // Beam depends on hitting
        effect eRay = EffectBeam(VFX_BEAM_FIRE, oCaster, BODY_NODE_HAND, !nTouch);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eRay, oTarget);
    }
}

void ApplyDisintegrate(object oTarget, int nDamage)
{
    // Ahgggh annoyingly PermanentDeath isn't a settable flag in nwscript

    // New simpler way is to have us test if the death will happen and if it will we use
    // fake damage messages + DestroyObject

    // Note the spell will kill when people reach 0 HP so this covers dying anyway
    if (GetCurrentHitPoints(oTarget) - nDamage <= 0 &&
       !GetPlotFlag(oTarget) &&
       !GetImmortal(oTarget))
    {
        // Fake damage message (maybe)
        FakeDamageMessage(oTarget, oCaster, nDamage, DAMAGE_TYPE_MAGICAL);

        // If PC or henchman we just kill them
        if (GetIsPC(oTarget) || GetAssociateType(oTarget) == ASSOCIATE_TYPE_HENCHMAN)
        {
            effect eDeath = EffectDeath();
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);
        }
        else
        {
            // Set not lootable
            SetLootable(oTarget, FALSE);
            SetIsDestroyable(TRUE, FALSE, FALSE, oTarget);

            // Apply death (trigger scripts)
            effect eDeath = EffectDeath();
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);

            // Destroy them
            DestroyObject(oTarget, 0.1);
        }
    }
    else
    {
        // Didn't kill, just apply normal damage
        effect eDamage = EffectDamage(nDamage);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
    }
}

/*

    // What we want to do:
    // * Set them to not be lootable
    // * Damage them
    // ** If that kills them then apply invisibility effect and VFX
    // ** If it doesn't apply a minor VFX and set their original lootable state
    // If a PC or is a PC's henchman we don't apply the invisibility or change the lootable flag.

    effect eDamage = EffectDamage(nDamage);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);

    int bLootable = GetLootable(oTarget);
    int bDestroyable = GetIsDestroyable(oTarget);
    int bRaiseable = GetIsRaiseable(oTarget);
    int bSelectableWhenDead = GetIsSelectableWhenDead(oTarget);
    int bChangedFlags = FALSE;

    if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
    {
        // If dead we disappear them too, the body bag should appear since we set it before they died.
        if (!GetIsPC(oTarget) &&
             GetAssociateType(oTarget) != ASSOCIATE_TYPE_HENCHMAN &&
            !GetPlotFlag(oTarget) &&
            !GetImmortal(oTarget))
        {
            OP_Debug("Setting destroyable flags");
            SetLootable(oTarget, FALSE);
            SetIsDestroyable(FALSE, FALSE, FALSE, oTarget);
            bChangedFlags = TRUE;
        }
    }

    // Dead or not?
    if (GetIsDead(oTarget))
    {
        // The dust effect
        effect eVis = EffectVisualEffect(30000);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oTarget));

        // Invisible
        if (bChangedFlags || GetObjectType(oTarget) != OBJECT_TYPE_CREATURE)
        {
            OP_Debug("Setting invisible");
            effect eInvisible = UnyieldingEffect(EffectVisualEffect(VFX_COM_UNLOAD_MODEL));
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvisible, oTarget);
            DelayCommand(1.0, DestroyThem(oTarget));
        }
        // Now we should have died and the corpse magically disappear, but the loot bag should remain
    }
    else
    {
        // Minor VFX instead
        effect eVis = EffectVisualEffect(VFX_IMP_MAGBLUE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

        // Reset flags
        if (bChangedFlags)
        {
            SetLootable(oTarget, bLootable);
            SetIsDestroyable(bDestroyable, bRaiseable, bSelectableWhenDead, oTarget);
        }
    }
}

*/
void DestroyThem(object oTarget)
{
    SetIsDestroyable(TRUE, FALSE, FALSE, oTarget);
    DestroyObject(oTarget); // This should spawn the bodybag (ie SetLootable is FALSE)
}
