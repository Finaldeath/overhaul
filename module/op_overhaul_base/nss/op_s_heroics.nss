//::///////////////////////////////////////////////
//:: Heroics
//:: op_s_heroics.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard / Sorcerer 2
    Innate Level: 2
    School: Transmutation
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Touch
    Area of Effect / Target: Single
    Duration: 10 minutes / level
    Additional Counter Spells:
    Save: Harmless
    Spell Resistance: No

    The heroics spell temporarily grants the subject a feat from the fighter's
    bonus feat list. For the duration of the heroics spell, the subject can use
    the feat as if it were one of those the creature had selected. All
    prerequisites for the feat must be met by the target of this spell. A
    creature can only be affected by one Heroics spell at a time.

    The subspells allow you to choose a category of feats to apply;

    - Appropriate Feat (Feat from the below selection based on equipped weapons)
    - Melee Active Feat (Improved Knockdown, Improved Disarm, Whirlwind Attack, Knockdown, Sap, Disarm, Called Shot)
    - Melee Mode Feat (Greater Cleave, Cleave, Improved Power Attack, Power Attack)
    - Unarmed Feat (Stunning Fist, Deflect Arrows, Improved Unarmed Attack)
    - Ranged Feat (Rapid Shot, Called Shot, Point Blank Shot)
    - Weapon Feat (Weapon Specialization, Weapon Focus, Weapon Finesse (if applicable))
    - Defensive Feat (Improved Expertise, Expertise, Spring Attack, Mobility, Dodge, Improved Parry, Deflect Arrows (if unarmed), Blind Fight)
    - Two-Weapon Fighting Feat (Improved two-weapon fighting, Ambidexterity, Two-Weapon Fighting)

*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "op_i_feats"

// Check if we want to obtain nFeatId (ie we haven't got, and we can take it)
int CheckIfWeWantFeat(int nFeatId, object oCreature, json jCreature, object oFeedbackCreature);

// Gets an array of feats to try and apply
json GetArrayOfFeats(int nSpellId, json jFeatArray = JSON_ARRAY);

void main()
{
    if (DoSpellHook()) return;

    // Remove all existing spell effects
    RemoveEffectsFromSpell(oTarget, SPELL_HEROICS);

    // We need to know what feats we really know - so Json it is
    json jTarget = ObjectToJson(oTarget);

    // We need to have a list of feats in "priority order"
    json jFeatArray = GetArrayOfFeats(nSpellId);

    if (JsonGetLength(jFeatArray) == 0)
    {
        SendMessageToPC(oCaster, "Heroics: ERROR: Invalid spell ID?");
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SPELL_FAIL_HAND), oCaster);
        return;
    }

    // Check feats in order
    int nFeatToApply = FEAT_INVALID;

    // Check array
    // Now jArray is sorted we can loop it and use the OIDs we stored
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jFeatArray); nIndex++)
    {
        json jObject = JsonArrayGet(jFeatArray, nIndex);

        int nFeatId = JsonGetInt(jObject);

        // Note we will for now leave the feedback creature in place, later we might
        // want to just have it error out the last feat in the list issues.
        if (CheckIfWeWantFeat(nFeatId, oTarget, jTarget, oCaster))
        {
            nFeatToApply = nFeatId;
            break;
        }
    }

    // Check we can learn them. Upgraded feat if we have the original
    if (nFeatToApply == FEAT_INVALID)
    {
        SendMessageToPC(oCaster, "Heroics: No feats can be learned.");
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SPELL_FAIL_HAND), oCaster);
        return;
    }

    // Apply feat with feedback
    string sMessage = "Heroics feat granted: " + GetFeatName(nFeatToApply);
    SendMessageToPC(oTarget, sMessage);
    if (oTarget != oCaster) SendMessageToPC(oCaster, sMessage);

    // Reset nSpellId for the resulting application
    nSpellId = SPELL_HEROICS;

    float fDuration = GetDuration(nCasterLevel, MINUTES);

    effect eLink =
        EffectLinkEffects(EffectBonusFeat(nFeatToApply),
        EffectLinkEffects(EffectImmunity(EFFECT_ICON_BONUS_FEAT),
        EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE),
                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

// Check if we want to obtain nFeatId (ie we haven't got, and we can take it)
int CheckIfWeWantFeat(int nFeatId, object oCreature, json jCreature, object oFeedbackCreature)
{
    if (GetHasLearnedFeat(nFeatId, oCreature, jCreature))
    {
        SendMessageToPC(oFeedbackCreature, GetFeatName(nFeatId) + " has already been learned.");
        return FALSE;
    }

    if (GetHasFeatPrerequisites(nFeatId, oCreature, jCreature, oFeedbackCreature))
    {
        return TRUE;
    }
    return FALSE;
}

// Gets an array of feats to try and apply
json GetArrayOfFeats(int nSpellId, json jFeatArray)
{
    // Simplified version here is to do simply one feat option, upgraded if they
    // already have the given feat.
    switch (nSpellId)
    {
        // - Defensive Feat (Improved Expertise, Expertise, Spring Attack, Mobility, Dodge, Improved Parry, Deflect Arrows (if unarmed), Blind Fight)
        case SPELL_HEROICS_DEFENSIVE_FEAT:
        {
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_IMPROVED_EXPERTISE));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_EXPERTISE));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_SPRING_ATTACK));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_MOBILITY));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_DODGE));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_IMPROVED_PARRY));
            if (!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget))) jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_DEFLECT_ARROWS));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_BLIND_FIGHT));
        }
        break;
        // - Melee Active Feat (Improved Knockdown, Improved Disarm, Whirlwind Attack, Knockdown, Sap, Disarm, Called Shot)
        case SPELL_HEROICS_MELEE_ACTIVE_FEAT:
        {
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_IMPROVED_KNOCKDOWN));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_IMPROVED_DISARM));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_WHIRLWIND_ATTACK));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_KNOCKDOWN));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_SAP));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_DISARM));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_CALLED_SHOT));
        }
        break;
        // - Melee Mode Feat (Greater Cleave, Cleave, Improved Power Attack, Power Attack)
        case SPELL_HEROICS_MELEE_MODE_FEAT:
        {
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_GREAT_CLEAVE));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_CLEAVE));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_IMPROVED_POWER_ATTACK));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_POWER_ATTACK));
        }
        break;
        // - Ranged Feat (Rapid Shot, Called Shot, Point Blank Shot)
        case SPELL_HEROICS_RANGED_FEAT:
        {
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_RAPID_SHOT));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_CALLED_SHOT));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_POINT_BLANK_SHOT));
        }
        break;
        // - Two-Weapon Fighting Feat (Improved two-weapon fighting, Ambidexterity, Two-Weapon Fighting)
        case SPELL_HEROICS_TWOWEAPON_FIGHTING_FEAT:
        {
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_IMPROVED_TWO_WEAPON_FIGHTING));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_AMBIDEXTERITY));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_TWO_WEAPON_FIGHTING));
        }
        break;
        // - Unarmed Feat (Stunning Fist, Deflect Arrows, Improved Unarmed Attack)
        case SPELL_HEROICS_UNARMED_FEAT:
        {
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_STUNNING_FIST));
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_DEFLECT_ARROWS));

            // If they have creature weapons ignore this feat, it's useless
            if (!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oTarget)) &&
                !GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oTarget)) &&
                !GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oTarget)))
                jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_IMPROVED_UNARMED_STRIKE));
        }
        break;
        // - Weapon Feat (Weapon Specialization, Weapon Focus, Weapon Finesse (if applicable))
        case SPELL_HEROICS_WEAPON_FEAT:
        {
            // Gets item in right hand for this
            object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);

            if (!GetIsObjectValid(oItem))
            {
                jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_WEAPON_SPECIALIZATION_UNARMED_STRIKE));
                jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_WEAPON_FOCUS_UNARMED_STRIKE));
            }
            // Ignore misc non-weapon stuff
            else if (GetItemIsWeapon(oItem))
            {
                int nFeat = GetItemWeaponSpecializationFeat(oItem);
                if (nFeat != FEAT_INVALID)
                {
                    jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(nFeat));
                }

                nFeat = GetItemWeaponFocusFeat(oItem);
                if (nFeat != FEAT_INVALID)
                {
                    jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(nFeat));
                }
            }
            // Add Weapon Finesse if nothing else
            jFeatArray = JsonArrayInsert(jFeatArray, JsonInt(FEAT_WEAPON_FINESSE));
        }
        break;
        // Default to "Appropriate" feat, eg if the master spell is cast somehow
        // case SPELL_HEROICS_APPROPRIATE_FEAT:
        default:
        {
            object oRightItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);
            object oLeftItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTarget);

            if (!GetIsObjectValid(oRightItem))
            {
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_UNARMED_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_MELEE_ACTIVE_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_MELEE_MODE_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_WEAPON_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_DEFENSIVE_FEAT, jFeatArray);
            }
            // Two weapons
            // Double sided weapons
            else if ((GetItemIsWeapon(oRightItem) && GetItemIsWeapon(oLeftItem)) ||
                      StringToInt(Get2DAString("baseitems", "WeaponWield", GetBaseItemType(oRightItem))) == 8)
            {
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_TWOWEAPON_FIGHTING_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_MELEE_ACTIVE_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_MELEE_MODE_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_WEAPON_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_DEFENSIVE_FEAT, jFeatArray);
            }
            // Ranged or throwing weapon
            else if (GetWeaponRanged(oRightItem))
            {
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_RANGED_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_WEAPON_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_DEFENSIVE_FEAT, jFeatArray);
            }
            // Default 1 weapon
            else
            {
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_MELEE_ACTIVE_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_MELEE_MODE_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_WEAPON_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_DEFENSIVE_FEAT, jFeatArray);
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_UNARMED_FEAT, jFeatArray); // Why not
                jFeatArray = GetArrayOfFeats(SPELL_HEROICS_TWOWEAPON_FIGHTING_FEAT, jFeatArray); // Sure, throw it in
            }
        }
        break;
    }
    return jFeatArray;
}

