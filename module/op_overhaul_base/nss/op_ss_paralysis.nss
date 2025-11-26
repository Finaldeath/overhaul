//:://////////////////////////////////////////////
//:: Paralysis State Script
//:: op_ss_paralysis
//:://////////////////////////////////////////////
/*
    This heartbeat script fires when EffectParalyze is the highest priority
    state applied to a creature.

    Major change from NWN1 is it will allow a save every heartbeat against the
    original save DC.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// Checks for On Hit: Paralysis effects
int GetSavingThrowOfParalysis(int nSlot, object oCreature);

void main()
{
    // SpeakString("Paralysis State Script");

    // Save against the effect. Noting we only do this on effects which we haven't
    // literally just had occur on us since the script fires instantly.

    // Get the save DC stored by the effect
    object oCreator;
    effect eCheck = GetFirstEffect(OBJECT_SELF);
    while (GetIsEffectValid(eCheck) && nSpellSaveDC == 0)
    {
        if (GetEffectType(eCheck, TRUE) == EFFECT_TYPE_PARALYZE)
        {
            // DO NOT APPLY PERMANENTLY/INSTANTLY!
            // Use Cutscene Immobilize (no state script) or similar for that.
            if (GetEffectDurationType(eCheck) != DURATION_TYPE_TEMPORARY)
            {
                Debug("[op_ss_paralysis] Found Paralysis effect with non-temporary duration. Do not do this!", ERROR);
            }
            // Duration needs to have ticked down a little
            else if (GetEffectDuration(eCheck) != GetEffectDurationRemaining(eCheck))
            {
                // Just use the first
                oCreator = GetEffectCreator(eCheck);

                if (GetJsonMetadataIsValid(GetEffectTag(eCheck))) nSpellSaveDC = GetEffectTaggedSpellSaveDC(eCheck);

                // If not set it'll be from an item property check for item property
                // on their items. We don't know if they hit us or we hit them so
                // we just do it in this order and assume there isn't 2 items with
                // the property.
                if (nSpellSaveDC == 0)
                {
                    nSpellSaveDC = GetSavingThrowOfParalysis(INVENTORY_SLOT_RIGHTHAND, oCreator);
                    if (nSpellSaveDC == 0 && GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCreator)))
                    {
                        // Check ammo
                        switch (GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCreator)))
                        {
                            case BASE_ITEM_HEAVYCROSSBOW:
                            case BASE_ITEM_LIGHTCROSSBOW:
                            {
                                nSpellSaveDC = GetSavingThrowOfParalysis(INVENTORY_SLOT_BOLTS, oCreator);
                            }
                            break;
                            case BASE_ITEM_LONGBOW:
                            case BASE_ITEM_SHORTBOW:
                            {
                                nSpellSaveDC = GetSavingThrowOfParalysis(INVENTORY_SLOT_ARROWS, oCreator);
                            }
                            break;
                            case BASE_ITEM_SLING:
                            {
                                nSpellSaveDC = GetSavingThrowOfParalysis(INVENTORY_SLOT_BULLETS, oCreator);
                            }
                            break;
                        }
                    }

                    // Check left hand (shield we hit or weapon hitting us)
                    if (nSpellSaveDC == 0) nSpellSaveDC = GetSavingThrowOfParalysis(INVENTORY_SLOT_LEFTHAND, oCreator);

                    // Check armor (we can hit)
                    if (nSpellSaveDC == 0) nSpellSaveDC = GetSavingThrowOfParalysis(INVENTORY_SLOT_CHEST, oCreator);

                    // Note: we should not have to check the creature weapons since Monster On Hit does oddly
                    // not include paralysis/hold!

                    // Fallback Dummy value
                    if (nSpellSaveDC == 0)
                    {
                        Debug("[op_ss_paralysis] Fallback dummy DC of 13.");
                        nSpellSaveDC = 13;
                    }
                }
            }
        }
        eCheck = GetNextEffect(OBJECT_SELF);
    }

    if (DoSavingThrow(OBJECT_SELF, oCreator, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_PARALYSIS))
    {
        FloatingTextStrRefOnCreature(STRREF_FREED_FROM_PARALYSIS, OBJECT_SELF, FALSE); // *Freed from Paralysis*
        RemoveEffect(OBJECT_SELF, eCheck);
    }
}

// Checks for On Hit: Paralysis effects
int GetSavingThrowOfParalysis(int nSlot, object oCreature)
{
    object oItem = GetItemInSlot(nSlot, oCreature);

    itemproperty ipCheck = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(ipCheck))
    {
        if (GetItemPropertyType(ipCheck) == ITEM_PROPERTY_ON_HIT_PROPERTIES)
        {
            if (GetItemPropertySubType(ipCheck) == IP_CONST_ONHIT_HOLD)
            {
                // Need the value from IPRP_ONHITCOST
                int nCostTableRow = GetItemPropertyCostTableValue(ipCheck);

                if (nCostTableRow >= 0)
                {
                    string sValue = Get2DAString("iprp_onhitcost", "Value", nCostTableRow);

                    if (sValue != "")
                    {
                        return StringToInt(sValue);
                    }
                }
            }
        }
        // ITEM_PROPERTY_ON_MONSTER_HIT doesn't include paralysis/hold (oddly)
        ipCheck = GetNextItemProperty(oItem);
    }
    return 0;
}
