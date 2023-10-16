//::///////////////////////////////////////////////
//:: nw_O0_LevelUp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 This script fires whenever a player levels up.
 If the henchmen is capable of going up a level, they do.
 Place in the OnPlayerLevelUp event in Module Properties
*/
//:://////////////////////////////////////////////
//:: Created By:     Brent
//:: Created On:     2002
//:://////////////////////////////////////////////
//#include "nw_i0_henchman"
#include "nw_i0_generic"
#include "help_hench"

void main()
{
    int i,j;
    object oItem,oNew,oFam;

    object oPC = GetPCLevellingUp();
    if (GetIsPC(oPC) == TRUE)
    {
        // Copy familiar/animal companion's inventory.
        for (j = 1; j <= 2; ++j)
        {
            if (j == 1) oFam = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC);

            if (j == 2) oFam = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oPC);

            if (oFam != OBJECT_INVALID)
            {
                for(i = 0; i < NUM_INVENTORY_SLOTS; ++i)
                {
                    oItem = GetItemInSlot(i,oFam);

                    if (oItem != OBJECT_INVALID)
                    {
                        switch (GetBaseItemType(oItem))
                        {
                          case BASE_ITEM_CREATUREITEM:
                          case BASE_ITEM_CBLUDGWEAPON:
                          case BASE_ITEM_CSLASHWEAPON:
                          case BASE_ITEM_CSLSHPRCWEAP:
                          case BASE_ITEM_CPIERCWEAPON: break;

                          default:
                            oNew = CreateItemOnObject(GetTag(oItem),oPC,GetNumStackedItems(oItem));
                            if (GetIdentified(oItem)) SetIdentified(oNew,TRUE);
                            break;
                        }
                    }
                }

                // Now go through the backpack.

                oItem = GetFirstItemInInventory(oFam);

                while (oItem != OBJECT_INVALID)
                {
                    CreateItemOnObject(GetTag(oItem),oPC,GetNumStackedItems(oItem));
                    oItem = GetNextItemInInventory(oFam);
                }
            }
        }

        LevelUpAllHenchmen(oPC);
/*
        int iNth = 1;
        object oHench = GetHenchman(oPC, iNth);
        while (oHench != OBJECT_INVALID)
        {
            LevelUpHenchman(oHench);
            iNth++;
            oHench = GetHenchman(oPC, iNth);
        }
*/
    }
}

