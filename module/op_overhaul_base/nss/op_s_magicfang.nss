//::///////////////////////////////////////////////
//:: Magic Fang and Greater Magic Fang
//:: op_s_magicfang.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Druid 1, Ranger 1
    Innate Level: 1
    School: Transmutation
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Touch
    Area of Effect / Target: Single
    Duration: 1 Minute / Level
    Additional Counter Spells:
    Save: None
    Spell Resistance: No

    This spell strengthens the a creatures natural weapons, giving them +1 to
    hit and +1 to damage. This counts as an enchantment bonus for bypassing
    damage reduction. This will not affect unarmed attacks.

    Caster Level(s): Druid 3, Ranger 3
    Innate Level: 3
    School: Transmutation
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Touch
    Area of Effect / Target: Single
    Duration: 1 turn / level
    Additional Counter Spells:
    Save: None
    Spell Resistance: No

    This spell strengthens the a creatures natural weapons, giving them +1 to
    hit and +1 to damage for every three levels of the caster (maximum of +5).
    This counts as an enchantment bonus for bypassing damage reduction. This
    will not affect unarmed attacks.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    SignalSpellCastAt();
    float fDuration = 6.0; //GetDuration(nCasterLevel, MINUTES);

    int nMax = nSpellId == SPELL_GREATER_MAGIC_FANG ? 5 : 1;
    int nBonus = clamp(nCasterLevel/3, 1, nMax);

    itemproperty ipBonus = ItemPropertyEnhancementBonus(nBonus);

    int bApplied = FALSE;

    json jArray = JsonArray();

    // Remove past EffectRunScript effects but don't need to trigger them
    RemoveEffectsFromSpell(oTarget, nSpellId);

    object oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oTarget);
    if (GetIsObjectValid(oItem))
    {
        DebugItemProperties(oItem);

        json jObject = JsonObject();
        jObject = JsonObjectSet(jObject, "objectid", JsonString(ObjectToString(oItem)));
        jArray = JsonArrayInsert(jArray, jObject);

        bApplied = TRUE;
        ApplySpellItemPropertyToItem(DURATION_TYPE_TEMPORARY, ipBonus, oItem, fDuration);
    }

    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oTarget);
    if (GetIsObjectValid(oItem))
    {
        DebugItemProperties(oItem);

        json jObject = JsonObject();
        jObject = JsonObjectSet(jObject, "objectid", JsonString(ObjectToString(oItem)));
        jArray = JsonArrayInsert(jArray, jObject);

        bApplied = TRUE;
        ApplySpellItemPropertyToItem(DURATION_TYPE_TEMPORARY, ipBonus, oItem, fDuration);
    }

    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oTarget);
    if (GetIsObjectValid(oItem))
    {
        DebugItemProperties(oItem);

        json jObject = JsonObject();
        jObject = JsonObjectSet(jObject, "objectid", JsonString(ObjectToString(oItem)));
        jArray = JsonArrayInsert(jArray, jObject);

        bApplied = TRUE;
        ApplySpellItemPropertyToItem(DURATION_TYPE_TEMPORARY, ipBonus, oItem, fDuration);
    }
    if (bApplied == TRUE)
    {
        effect eVis = EffectVisualEffect(VFX_IMP_HOLY_AID);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        // We apply a EffectRunScript that clears the item properties on removal
        // (ie dispel magic, resting)
        effect eLink = EffectLinkEffects(EffectTrackItemProperties(jArray),
                                         EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
        SetItemTrackingID(eLink);
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
    }
    else
    {
        // No creature items?
        SendMessageToPC(oCaster, "Magic Fang: No creature weapons found on " + GetName(oTarget) + ".");
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SPELL_FAIL_HAND), oCaster);
    }
}

