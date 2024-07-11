//::///////////////////////////////////////////////
//:: Magic Missile
//:: op_s_magicmissil.nss
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
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nMissiles, nMaxMissilesPerCreature = 99999, nDiceNum, nDiceSize, nDamageBonus, nDamageType, nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nVisMissile = VFX_INVALID, nVis = VFX_INVALID;

    switch (nSpellId)
    {
        case SPELL_MAGIC_MISSILE:
        {
            nMissiles = min((nCasterLevel + 1) / 2, 5);
            nDiceNum = 1;
            nDiceSize = 4;
            nDamageBonus = 1;
            nDamageType = DAMAGE_TYPE_MAGICAL;
            nVisMissile = VFX_IMP_MIRV;
            nVis = VFX_IMP_MAGBLUE;
        }
        break;
        case SPELL_ISAACS_LESSER_MISSILE_STORM:
        {
            nMissiles = min(nCasterLevel, 10);
            nMaxMissilesPerCreature = 5;
            nDiceNum = 1;
            nDiceSize = 6;
            nDamageBonus = 0;
            nDamageType = DAMAGE_TYPE_MAGICAL;
            nVisMissile = VFX_IMP_MIRV;
            nVis = VFX_IMP_MAGBLUE;
        }
        break;
        case SPELL_ISAACS_GREATER_MISSILE_STORM:
        {
            nMissiles = min(nCasterLevel, 20);
            nMaxMissilesPerCreature = 5;
            nDiceNum = 2;
            nDiceSize = 6;
            nDamageBonus = 0;
            nDamageType = DAMAGE_TYPE_MAGICAL;
            nVisMissile = VFX_IMP_MIRV;
            nVis = VFX_IMP_MAGBLUE;
        }
        break;
        default:
            OP_Debug("[op_s_mirv] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        json jArray = GetArrayOfTargets(SPELL_TARGET_SELECTIVEHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);

        // Work out how many per creature, but need at least 1 :)
        if (JsonGetLength(jArray) > 0)
        {
            int nMissilesPerCreature = max(1, nMissiles / JsonGetLength(jArray));
            int nExtraMissiles = nMissiles - (nMissilesPerCreature * JsonGetLength(jArray));
            if (nMissilesPerCreature > nMaxMissilesPerCreature) nMissilesPerCreature = nMaxMissilesPerCreature;

            SpeakString("nMissiles: " + IntToString(nMissiles) + " nMissilesPerCreature: " + IntToString(nMissilesPerCreature) + " Creatures: " + IntToString(JsonGetLength(jArray)) + " nExtraMissiles: " + IntToString(nExtraMissiles));

            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                SignalSpellCastAt();

                if (nMissiles > 0)
                {
                    float fDelay = GetVisualEffectHitDelay(nVisMissile, oTarget, oCaster);
                    float fDeltaTime = 0.0;

                    int bResist = DoResistSpell(oTarget, oCaster, fDelay);

                    // Sort each missile in turn
                    int nCnt;
                    for (nCnt = 1; nCnt <= nMissilesPerCreature && nMissiles > 0; nCnt++)
                    {
                        nMissiles--;

                        DelayCommand(fDeltaTime, ApplyVisualEffectToObject(nVisMissile, oTarget));

                        if (!bResist)
                        {
                            // Roll damage
                            int nDamage = GetDiceRoll(nDiceNum, nDiceSize, nDamageBonus);

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
    else
    {
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            // Fire cast spell at event for the specified target
            SignalSpellCastAt();

            float fDelay = GetVisualEffectHitDelay(nVisMissile, oTarget, oCaster);
            float fDeltaTime = 0.0;

            int bResist = DoResistSpell(oTarget, oCaster, fDelay);

            // Sort each missile in turn
            int nCnt;
            for (nCnt = 1; nCnt <= nMissiles; nCnt++)
            {
                DelayCommand(fDeltaTime, ApplyVisualEffectToObject(nVisMissile, oTarget));

                if (!bResist)
                {
                    // Roll damage
                    int nDamage = GetDiceRoll(nDiceNum, nDiceSize);

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
