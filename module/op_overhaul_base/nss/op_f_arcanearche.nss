//::///////////////////////////////////////////////
//:: Arcane Archer Feat Abilities
//:: op_f_arcanearche
//:://////////////////////////////////////////////
/*
    Imbue Arrow - Fireball

    Seeker Arrow - Fire arrow

    Hail of Arrows - AOE arrows

    Arrow of Death - death arrow!

    Most of these may be moved to relevant "grouped spell" scripts at some stage.
    For now bits of those are copied here.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "x2_inc_itemprop"

int ArcaneArcherCalculateBonus(object oArcher);
int ArcaneArcherDamageDoneByBow(int bCrit, object oUser);

void main()
{
    if (DoSpellHook()) return;

    switch (nSpellId)
    {
        case SPELLABILITY_AA_IMBUE_ARROW:
        {
            // Basically fireball with a different caster level
            nCasterLevel = GetLevelByClass(CLASS_TYPE_ARCANE_ARCHER,oCaster);
            if (nCasterLevel > 10)
            {
                nCasterLevel = 10 + ((nCasterLevel-10)/2);      // add some epic progression of 1d6 per 2 levels after 10
            }
            else // * preserve minimum damage of 10d6
            {
                 nCasterLevel = 10;
            }

            ApplyVisualEffectAtLocation(VFX_FNF_FIREBALL, lTarget);

            // * GZ: Add arrow damage if targeted on creature...
            if (GetIsObjectValid(oTarget))
            {
                if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
                {
                    int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);
                    if (nTouch > 0)
                    {
                        int nDamage = ArcaneArcherDamageDoneByBow(nTouch == 2, oCaster);
                        int nBonus = ArcaneArcherCalculateBonus(oCaster);

                        ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_PIERCING, IPGetDamagePowerConstantFromNumber(nBonus));
                        ApplyDamageToObject(oTarget, nBonus, DAMAGE_TYPE_MAGICAL);
                    }
                }
            }

            ApplyVisualEffectAtLocation(VFX_FNF_FIREBALL, lTarget);

            json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                SignalSpellCastAt();

                float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;
                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    // Roll damage
                    int nDamage = GetDiceRoll(nCasterLevel, 6);

                    // Damage modification based on save (half, with Reflex allowing feats to reduce further)
                    int bSaved = DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_FIRE, fDelay);

                    nDamage = GetDamageBasedOnFeats(nDamage, oTarget, SAVING_THROW_REFLEX, bSaved);

                    if (nDamage > 0)
                    {
                        DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nDamage, DAMAGE_TYPE_FIRE));
                    }
                }
            }
        }
        break;
        case SPELLABILITY_AA_SEEKER_ARROW_1:
        case SPELLABILITY_AA_SEEKER_ARROW_2:
        {
            SignalSpellCastAt();

            object oTarget = GetSpellTargetObject();

            if (GetIsObjectValid(oTarget))
            {
                SignalSpellCastAt();

                int nDamage = ArcaneArcherDamageDoneByBow(FALSE, oCaster) * 2;
                int nBonus = ArcaneArcherCalculateBonus(oCaster);

                if (nDamage > 0)
                {
                    ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_PIERCING, IPGetDamagePowerConstantFromNumber(nBonus));
                    ApplyDamageWithVFXToObject(oTarget, VFX_IMP_MAGBLUE, nBonus, DAMAGE_TYPE_MAGICAL);
                }
            }
        }
        break;
        case SPELLABILITY_AA_HAIL_OF_ARROWS:
        {
            json jArray = GetArrayOfTargets(SPELL_TARGET_SELECTIVEHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
            // Work out how many per creature, but need at least 1 :) stops divide by 0 issues.
            if (JsonGetLength(jArray) > 0)
            {
                int nMissilesPerCreature = 1;

                float fDeltaTime = 0.0;

                int nIndex;
                for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
                {
                    oTarget = GetArrayObject(jArray, nIndex);

                    SignalSpellCastAt();

                    float fDelay = GetVisualEffectHitDelay(VFX_IMP_MIRV_NORMAL_ARROW, oTarget, oCaster);

                    int nTouchResult = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);

                    DelayCommand(fDeltaTime, ApplyVisualEffectToObject(VFX_IMP_MIRV_NORMAL_ARROW, oTarget, !nTouchResult));

                    if (nTouchResult)
                    {
                        // Roll damage
                        int nDamage = ArcaneArcherDamageDoneByBow(nTouchResult == 2, oCaster);
                        int nBonus = ArcaneArcherCalculateBonus(oCaster);

                        if (nDamage > 0)
                        {
                            DelayCommand(fDelay + fDeltaTime, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_PIERCING, IPGetDamagePowerConstantFromNumber(nBonus)));
                            DelayCommand(fDelay + fDeltaTime, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_MAGBLUE, nBonus, DAMAGE_TYPE_MAGICAL));
                        }
                    }
                    // Add a little more to the delay
                    fDeltaTime += 0.1;
                }
            }
        }
        break;
        case SPELLABILITY_AA_ARROW_OF_DEATH:
        {
            SignalSpellCastAt();

            object oTarget = GetSpellTargetObject();

            if (GetIsObjectValid(oTarget))
            {
                SignalSpellCastAt();

                int nDamage = ArcaneArcherDamageDoneByBow(FALSE, oCaster) * 2;
                int nBonus = ArcaneArcherCalculateBonus(oCaster);

                if (nDamage > 0)
                {
                    ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_PIERCING, IPGetDamagePowerConstantFromNumber(nBonus));
                    ApplyDamageWithVFXToObject(oTarget, VFX_IMP_MAGBLUE, nBonus, DAMAGE_TYPE_MAGICAL);

                    // * if target fails a save DC20 they die
                    // This isn't a death spell so no death saving throw
                    if (DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, 20) == 0)
                    {
                        float fDelay = 0.0;
                        effect eDeath = EffectDeath();
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_DEATH_L, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                    }
                }
            }
        }
        break;
        default:
        {
            Debug("[Sleep op_s_sleep] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }
}

int ArcaneArcherCalculateBonus(object oArcher)
{
    int nLevel = GetLevelByClass(CLASS_TYPE_ARCANE_ARCHER, oArcher);

    if (nLevel == 0) //not an arcane archer?
    {
        return 0;
    }
    return ((nLevel+1)/2); // every odd level after 1 get +1
}

int ArcaneArcherDamageDoneByBow(int bCrit = FALSE, object oUser = OBJECT_SELF)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
    int nDamage;
    int bSpec = FALSE;
    int bEpicSpecialization = FALSE;

    if (GetIsObjectValid(oItem) == TRUE)
    {
        if (GetBaseItemType(oItem) == BASE_ITEM_LONGBOW )
        {
            nDamage = d8();
            if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_LONGBOW,oUser))
            {
              bSpec = TRUE;
            }
            if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_LONGBOW,oUser))
            {
              bEpicSpecialization = TRUE;
            }
        }
        else
        if (GetBaseItemType(oItem) == BASE_ITEM_SHORTBOW)
        {
            nDamage = d6();
            if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SHORTBOW,oUser))
            {
              bSpec = TRUE;
            }
            if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SHORTBOW,oUser))
            {
              bEpicSpecialization = TRUE;
            }
        }
        else
            return 0;
    }
    else
    {
            return 0;
    }

    // add strength bonus
    int nStrength = GetAbilityModifier(ABILITY_STRENGTH,oUser);
    nDamage += nStrength;

    if (bSpec == TRUE)
    {
        nDamage +=2;
    }
    if ( bEpicSpecialization == TRUE )
    {
        nDamage +=4;
    }
    if (bCrit == TRUE)
    {
         nDamage *=3;
    }

    return nDamage;
}
