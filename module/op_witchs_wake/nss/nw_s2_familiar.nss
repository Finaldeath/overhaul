//::///////////////////////////////////////////////
//:: Summon Familiar
//:: NW_S2_Familiar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This spell summons an Arcane casters familiar
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 27, 2001
//:://////////////////////////////////////////////

/////////////////////////////////////////////////////////////
// Custom WW Behavior to get rid of overpowered familiars. //
/////////////////////////////////////////////////////////////

void AlterHide(object oPC)
{
    //Identify the familiar's Hide item.
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oFamiliar);

    //Cycle through the Hide's item properties.
    itemproperty ipHide = GetFirstItemProperty(oHide);
    while (GetIsItemPropertyValid(ipHide) == TRUE)
    {
        //Search for any Regeneration or Damage Reduction properties
        if (GetItemPropertyType(ipHide) == ITEM_PROPERTY_REGENERATION ||
            GetItemPropertyType(ipHide) == ITEM_PROPERTY_DAMAGE_REDUCTION)
        {
            //Remove them...
            RemoveItemProperty(oHide, ipHide);

            //Replace generic Regeneration with Vampiric Regeneration
            if (GetItemPropertyType(ipHide) == ITEM_PROPERTY_REGENERATION)
            {
                //Determine the desired strength of the Vampiric Regeneration.
                int iLevel = GetLevelByPosition(1, oFamiliar) +
                             GetLevelByPosition(2, oFamiliar) +
                             GetLevelByPosition(3, oFamiliar);
                itemproperty ipVampRegen = ItemPropertyVampiricRegeneration(iLevel/2);

                //Identify creature weapons to apply it to.
                object oRight = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oFamiliar);
                object oLeft = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oFamiliar);

                //Add the item property.
                AddItemProperty(DURATION_TYPE_PERMANENT, ipVampRegen, oRight);
                AddItemProperty(DURATION_TYPE_PERMANENT, ipVampRegen, oLeft);
            }
        }

        //Update the loop variable
        ipHide = GetNextItemProperty(oHide);
    }
}

void main()
{
    //Yep thats it
    SummonFamiliar();

    /////////////////////////////////////////////////////////////
    // Custom WW Behavior to get rid of overpowered familiars. //
    /////////////////////////////////////////////////////////////
    object oPC = OBJECT_SELF;
    DelayCommand(1.0, AlterHide(oPC));
}
