//::///////////////////////////////////////////////
//:: Module Item (OnUnAcquireItem)
//:: UAI_ModuleItem.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the UnAcquisition of any plot items
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetModuleItemLostBy();
    object oItem = GetModuleItemLost();
    string sItem = GetTag(oItem);
    object oPossessor = GetItemPossessor(oItem);
    string sPossessor = GetTag(oPossessor);

    //Only worry about items dropped by a player.
    if (GetIsPC(oPC) == TRUE)
    {
        //Handle Containers
        int iItemType = GetBaseItemType(oItem);
        if (iItemType == BASE_ITEM_LARGEBOX)
        {
            //Parse their inventory for important items
            object oContainerItem = GetFirstItemInInventory(oItem);
            while (oContainerItem != OBJECT_INVALID)
            {
                string sContainerItem = GetTag(oContainerItem);
                if (sContainerItem == "ScarabKey" ||
                    sContainerItem == "GolemMakersRing" ||
                    sContainerItem == "Key_Crypt_01" ||
                    sContainerItem == "Library_Inkwell" ||
                    sContainerItem == "Library_Pen" ||
                    sContainerItem == "PortableDoor" ||
                    sContainerItem == "ITEM_DarkWind" ||
                    sContainerItem == "ITEM_DeadWind" ||
                    sContainerItem == "ITEM_WiseWind")
                {
                    //Provide an error message
                    FloatingTextStrRefOnCreature(40578, oPC, FALSE);
                    //Copy item back into their inventory.
                    CopyItem(oContainerItem, oPC);
                    //Destroy original
                    DestroyObject(oContainerItem, 1.0);
                }
                //Update the loop variable.
                oContainerItem = GetNextItemInInventory(oItem);
            }
        }

        //Handle Plot items
        int bPlot = GetPlotFlag(oItem);
        if (bPlot == TRUE)
        {
            if (sItem == "ScarabKey" ||
                sItem == "GolemMakersRing" ||
                sItem == "Key_Crypt_01" ||
                sItem == "Library_Inkwell" ||
                sItem == "Library_Pen" ||
                sItem == "PortableDoor")
            {
                //Provide an error message
                FloatingTextStrRefOnCreature(40578, oPC, FALSE);
                //Copy item back into their inventory.
                CopyItem(oItem, oPC);
                //Destroy original
                DestroyObject(oItem, 2.0);
            }
            else if (sItem == "GiantFlesh")//Winds - Shank of Meat
            {
                //Do nothing. It can stay where they drop it.
            }
            else if (sItem == "ITEM_DarkWind" || //The Three Winds
                     sItem == "ITEM_DeadWind" ||
                     sItem == "ITEM_WiseWind")
            {
                //If it's not being put in the Ark
                if (sPossessor != "ArkOfWinds")
                {
                    //Provide an error message
                    FloatingTextStrRefOnCreature(40578, oPC, FALSE);
                    //Copy item back into their inventory.
                    CopyItem(oItem, oPC);
                    //Destroy original
                    DestroyObject(oItem, 1.0);
                }
            }
        }
    }
}
