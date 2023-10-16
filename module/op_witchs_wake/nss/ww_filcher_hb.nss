//::///////////////////////////////////////////////
//:: Witchwork: Ethereal Filcher Heartbeat Script
//:: WW_Filcher_HB.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Ethereal Filcher's pickpocketing
     of the PCs and emptying of inventory into
     the Treasure Piles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oFilcherItem = GetFirstItemInInventory();
    int iFilcherGold = GetGold();

    //If my inventory is empty & I have no gold...
    if (oFilcherItem == OBJECT_INVALID &&
        iFilcherGold == 0)
    {
        int nNth = 1;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, nNth);
        object oPCArea = GetArea(oPC);
        object oMyArea = GetArea(OBJECT_SELF);
        int bPCInFilchMaze = GetLocalInt(oPC, "bPCInFilchMaze");
        object oTargetItem;

        while(TRUE)
        {
            if (oPC != OBJECT_INVALID &&
                GetIsDM(oPC) == FALSE &&
                oPCArea == oMyArea &&
                bPCInFilchMaze == TRUE)
            {
                oTargetItem = GetFirstItemInInventory(oPC);
                int bPlotItem = GetPlotFlag(oTargetItem);
                object oSlotArms = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC);
                object oSlotArrows = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC);
                object oSlotBelt = GetItemInSlot(INVENTORY_SLOT_BELT, oPC);
                object oSlotBolts = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
                object oSlotBoots = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC);
                object oSlotBullets = GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC);
                object oSlotCArmour = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);
                object oSlotChest = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
                object oSlotCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC);
                object oSlotCWeapon_B = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPC);
                object oSlotCWeapon_L = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC);
                object oSlotCWeapon_R = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC);
                object oSlotHead = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
                object oSlotLeftHand = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
                object oSlotLeftRing = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
                object oSlotNeck = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
                object oSlotRightHand = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
                object oSlotRightRing = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

                //Determine the players level...
                int iClass1Level = GetLevelByPosition(1, oPC);
                int iClass2Level = GetLevelByPosition(2, oPC);
                int iClass3Level = GetLevelByPosition(3, oPC);
                int iCharLevel = iClass1Level + iClass2Level + iClass3Level;

                //Use that to determine how much gold it should steal...
                int iBaseGold = iCharLevel * iCharLevel * iCharLevel;
                int iRandomModifier = Random(iBaseGold * 20) - (iBaseGold * 10);
                int iFinalGold = iBaseGold + iRandomModifier;

                //Parse the PC's inventory to ensure they have a valid item
                //(non-plot, non-equipped)
                while (oTargetItem != OBJECT_INVALID &&
                      (bPlotItem == TRUE             ||
                       oTargetItem == oSlotArms      ||
                       oTargetItem == oSlotArrows    ||
                       oTargetItem == oSlotBelt      ||
                       oTargetItem == oSlotBolts     ||
                       oTargetItem == oSlotBoots     ||
                       oTargetItem == oSlotBullets   ||
                       oTargetItem == oSlotCArmour   ||
                       oTargetItem == oSlotChest     ||
                       oTargetItem == oSlotCloak     ||
                       oTargetItem == oSlotCWeapon_B ||
                       oTargetItem == oSlotCWeapon_L ||
                       oTargetItem == oSlotCWeapon_R ||
                       oTargetItem == oSlotHead      ||
                       oTargetItem == oSlotLeftHand  ||
                       oTargetItem == oSlotLeftRing  ||
                       oTargetItem == oSlotNeck      ||
                       oTargetItem == oSlotRightHand ||
                       oTargetItem == oSlotRightRing))
                {
                    oTargetItem = GetNextItemInInventory(oPC);
                    bPlotItem = GetPlotFlag(oTargetItem);
                }
                //If a valid item was found or the player still has gold...
                if (oTargetItem != OBJECT_INVALID ||
                    GetGold(oPC) > 0)
                {
                    //Send the filcher to pick the PC's pocket.
                    ClearAllActions();
                    ActionMoveToObject(oPC);
                    ActionDoCommand(TakeGoldFromCreature(iFinalGold, oPC));
                    ActionTakeItem(oTargetItem, oPC);
                    break;
                }
            }
            else
            {
                //No valid characters for filching
                if(oPC == OBJECT_INVALID || oPCArea != oMyArea)
                {
                    ActionRandomWalk();
                    break;
                }
            }
            nNth++;
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, nNth);
            oPCArea = GetArea(oPC);
            bPCInFilchMaze = GetLocalInt(oPC, "bPCInFilchMaze");
        }

    }
    //If my inventory is not empty or I do have gold...
    else
    {
        //Move to nearest treasure pile...
        object oTreasure = GetNearestObjectByTag("FilchersTreasure");
        ActionMoveToObject(oTreasure, TRUE);

        //and empty my gold and inventory into it.
        while (oFilcherItem != OBJECT_INVALID ||
               iFilcherGold != 0)
        {
            ActionGiveItem(oFilcherItem, oTreasure);
            CreateItemOnObject("nw_it_gold001", oTreasure, iFilcherGold);
            TakeGoldFromCreature(iFilcherGold, OBJECT_SELF, TRUE);
            oFilcherItem = GetNextItemInInventory();
            iFilcherGold = GetGold();
        }
    }
}
