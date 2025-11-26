//:://////////////////////////////////////////////
//:: MIRV spells
//:: op_s_mirv
//:://////////////////////////////////////////////
/*
    MIRV spells, ie Magic Missile, Missile Storms, Flame Arrow etc.

    We standardise some of the effects:
    * One SR check per target not per missile
    * Damage rolls per missile (with saving throws per missile) if applicable
    * Some spells have a per-target maximum if an Area of Effect

    Magic Missile
    1d4 + 1 damage, 1 + 1 missile per 2 caster levels max 5 at level 9.

    Issacs Lesser Missile Storm
    1d6 damage per missile. Up to 10 missiles. Max 5 per target.

    Issacs Greater Missile Storm
    2d6 damage per missile. Up to 20 missiles. Max 5 per target.

    Flame Arrow
    If targeting a creature, the caster launches 1 conjured fiery arrow at the
    target for every 4 caster levels. If a ranged touch attack for an arrow
    hits, the arrow does 4d6 points of fire damage. Only one spell resistance
    check is done for all the arrows however.

    Alternatively you can cast this on ammunition in your inventory (arrows,
    bolts or bullets) to add fire damage equal to half the caster level (up to
    +10). This enchantment lasts for 1 round per caster level.

    Ball Lightning
    Balls of lightning (one per caster level, maximum 15) appear and target any hostile
    creature in the area of effect. If there are more creatures than balls of
    lightning, only the closest targets will be damaged. If there are more
    balls of lightning than creatures, the excess balls of lighning disappear.
    Each ball of lightning explodes for 1d6 points of electricity damage per
    caster level (max 15d6).

    Firebrand
    As Ball Lightning but fire damage.

    Manticore Spikes
    Touch attack to damage. 6 spikes total. Can have 6 per creature.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nMissiles, nMaxMissilesPerCreature = 99999, nDiceNum, nDiceSize, nDamageBonus, nDamageType;
    int nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int bSpellResistance = TRUE;
    int bTouchAttackType = TOUCH_NONE;
    int nVisMissile = VFX_INVALID, nVis = VFX_INVALID;

    switch (nSpellId)
    {
        case SPELL_MAGIC_MISSILE:
        {
            nMissiles    = min((nCasterLevel + 1) / 2, 5);
            nDiceNum     = 1;
            nDiceSize    = 4;
            nDamageBonus = 1;
            nDamageType  = DAMAGE_TYPE_MAGICAL;
            nVisMissile  = VFX_IMP_MIRV;
            nVis         = VFX_IMP_MAGBLUE;
        }
        break;
        case SPELL_ISAACS_LESSER_MISSILE_STORM:
        {
            nMissiles               = min(nCasterLevel, 10);
            nMaxMissilesPerCreature = 5;
            nDiceNum                = 1;
            nDiceSize               = 6;
            nDamageBonus            = 0;
            nDamageType             = DAMAGE_TYPE_MAGICAL;
            nVisMissile             = VFX_IMP_MIRV;
            nVis                    = VFX_IMP_MAGBLUE;
        }
        break;
        case SPELL_ISAACS_GREATER_MISSILE_STORM:
        {
            nMissiles               = min(nCasterLevel, 20);
            nMaxMissilesPerCreature = 5;
            nDiceNum                = 2;
            nDiceSize               = 6;
            nDamageBonus            = 0;
            nDamageType             = DAMAGE_TYPE_MAGICAL;
            nVisMissile             = VFX_IMP_MIRV;
            nVis                    = VFX_IMP_MAGBLUE;
        }
        break;
        case SPELL_FLAME_ARROW:
        {
            // If target is an item apply the item effect
            if (GetIsObjectValid(oTarget) && GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
            {
                FireItemPropertySpellScript();
                return;
            }
            nMissiles = max(1, nCasterLevel/4);
            // No max per creature!
            bTouchAttackType = TOUCH_RANGED;
            nDiceNum         = 4;
            nDiceSize        = 6;
            nDamageBonus     = 0;
            nDamageType      = DAMAGE_TYPE_FIRE;
            nVisMissile      = VFX_IMP_MIRV_FLAME;
            nVis             = VFX_IMP_FLAME_S;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
        }
        break;
        case SPELL_BALL_LIGHTNING:
        {
            nMissiles               = min(15, nCasterLevel);
            nMaxMissilesPerCreature = 1;
            nDiceNum                = min(15, nCasterLevel);
            nDiceSize               = 6;
            nDamageBonus            = 0;
            nDamageType             = DAMAGE_TYPE_ELECTRICAL;
            nVisMissile             = VFX_IMP_MIRV_ELECTRIC;
            nVis                    = VFX_IMP_LIGHTNING_S;
            nSavingThrow            = SAVING_THROW_REFLEX;
            nSavingThrowType        = SAVING_THROW_TYPE_ELECTRICITY;
        }
        break;
        case SPELL_FIREBRAND:
        {
            nMissiles               = min(15, nCasterLevel);
            nMaxMissilesPerCreature = 1;
            nDiceNum                = min(15, nCasterLevel);
            nDiceSize               = 6;
            nDamageBonus            = 0;
            nDamageType             = DAMAGE_TYPE_FIRE;
            nVisMissile             = VFX_IMP_MIRV_FIREBALL;
            nVis                    = VFX_IMP_FLAME_M;
            nSavingThrow            = SAVING_THROW_REFLEX;
            nSavingThrowType        = SAVING_THROW_TYPE_FIRE;
        }
        break;
        case SPELLABILITY_MANTICORE_SPIKES:
        {
            nMissiles        = 6;
            // No max per creature!
            bTouchAttackType = TOUCH_RANGED;
            bSpellResistance = FALSE;
            nDiceNum         = 1;
            nDiceSize        = 8;
            nDamageBonus     = 2;
            nDamageType      = DAMAGE_TYPE_PIERCING;
            nVisMissile      = VFX_IMP_MIRV_NORMAL_DART; // TODO: Better vfx
            nVis             = VFX_IMP_MANTICORE_SPIKES;
        }
        break;
        default:
            Debug("[op_s_mirv] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;
    if (GetSpellIsAreaOfEffect(nSpellId)) nTargetType = SPELL_TARGET_SELECTIVEHOSTILE;

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    // Work out how many per creature, but need at least 1 :) stops divide by 0 issues.
    if (JsonGetLength(jArray) > 0)
    {
        int nMissilesPerCreature = max(1, nMissiles / JsonGetLength(jArray));
        int nExtraMissiles       = nMissiles - (nMissilesPerCreature * JsonGetLength(jArray));
        if (nMissilesPerCreature > nMaxMissilesPerCreature) nMissilesPerCreature = nMaxMissilesPerCreature;

        //SpeakString("nMissiles: " + IntToString(nMissiles) + " nMissilesPerCreature: " + IntToString(nMissilesPerCreature) + " Creatures: " + IntToString(JsonGetLength(jArray)) + " nExtraMissiles: " + IntToString(nExtraMissiles));

        float fDeltaTime = 0.0;

        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            if (nMissiles > 0)
            {
                float fDelay = GetVisualEffectHitDelay(nVisMissile, oTarget, oCaster);

                int bResist = bSpellResistance ? DoResistSpell(oTarget, oCaster, fDelay) : FALSE;

                // Sort each missile in turn
                int nCnt;
                for (nCnt = 1; nCnt <= nMissilesPerCreature && nMissiles > 0; nCnt++)
                {
                    nMissiles--;

                    int nTouchResult = DoTouchAttack(oTarget, oCaster, bTouchAttackType);

                    DelayCommand(fDeltaTime, ApplyVisualEffectToObject(nVisMissile, oTarget, !nTouchResult));

                    if (!bResist && nTouchResult)
                    {
                        // Roll damage
                        int nDamage = GetDiceRoll(nDiceNum, nDiceSize, nDamageBonus);

                        if (nTouchResult == TOUCH_RESULT_CRITICAL_HIT) nDamage *= 2;

                        // Damage modification based on save (half, with Reflex allowing feats to reduce further)
                        if (nSavingThrow != -1)
                        {
                            nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);
                        }

                        if (nDamage > 0)
                        {
                            effect eDamage = EffectDamage(nDamage, nDamageType);

                            if (nVis != VFX_INVALID) DelayCommand(fDelay + fDeltaTime, ApplyVisualEffectToObject(nVis, oTarget));
                            DelayCommand(fDelay + fDeltaTime, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                        }
                    }
                    // Add a little more to the delay
                    fDeltaTime += 0.1;
                }
            }
        }
    }
}
