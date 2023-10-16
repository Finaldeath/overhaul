//::///////////////////////////////////////////////
//:: Witch's Wake 1: Module OnClientEnter
//:: WW_OnClientEnter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is a template script that shows how to
     add any existing journal entries to the new
     player as soon as they enter the module. Edit
     as necessary.

     It also handles some other miscellaneous
     OnEnter tasks.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 30, 2002
//:://////////////////////////////////////////////

void main()
{
    //Make sure the player is commandable
    object oClient = GetEnteringObject();
    SetCommandable(TRUE, oClient);

    int bEnteredPreviously = GetLocalInt(oClient, "bEnteredPreviously");
    if (bEnteredPreviously == FALSE)
    {
        //Flag them as having entered the module once already (to prevent
        //re-running this when loading a SaveGame).
        SetLocalInt(oClient, "bEnteredPreviously", TRUE);

        //Set their XP to 0 to make sure everyone's at 1st level.
        SetXP(oClient, 0);

        //If the entering object is a DM...
        if (GetIsDM(oClient) == TRUE)
        {
            //...and doesn't already have the Witch Wake Handler...
            object oWitchWakeHandler = GetItemPossessedBy(oClient, "ww_plothandler");
            if (GetIsObjectValid(oWitchWakeHandler) == FALSE)
            {
                //Create a Witch Wake Handler in their inventory.
                CreateItemOnObject("ww_plothandler", oClient);
            }
        }

        //If the entering object is a PC & doesn't already have the Tattered
        //King's Armor...
        if(GetIsPC(oClient) == TRUE &&
           !GetIsObjectValid(GetItemPossessedBy(oClient,"TatteredKingsArmor")))
        {
            //strip them of all gold and items.
            int iGold = GetGold(oClient);
            TakeGoldFromCreature(iGold, oClient, TRUE);
            object oItem = GetItemInSlot(INVENTORY_SLOT_ARMS);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_ARROWS);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_BELT);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_BOLTS);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_BOOTS);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_BULLETS);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_CARMOUR);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_CHEST);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_HEAD);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_NECK);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            DestroyObject(oItem);
            oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING);
            DestroyObject(oItem);
            oItem = GetFirstItemInInventory(oClient);
            while (oItem != OBJECT_INVALID)
            {
                DestroyObject(oItem);
                oItem = GetNextItemInInventory(oClient);
            }

            //give them the armor and make them equip it.
            object oArmor = CreateItemOnObject("tatteredkingsarm", oClient);
            SetCommandable(TRUE, oClient);
            AssignCommand(oClient, ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST));
            DelayCommand(0.1, SetCommandable(FALSE, oClient));

            //give them a ring based on their alignment and make them equip it.
            int iAlignment = GetAlignmentLawChaos(oClient);
            int iRandom = Random(100)+1;
            if (iAlignment = ALIGNMENT_CHAOTIC ||
                (iAlignment = ALIGNMENT_NEUTRAL &&
                 iRandom > 50))
            {
                //Iron Ring (special use)
                object oIronRing = CreateItemOnObject("ww1_ironring", oClient);
                SetCommandable(TRUE, oClient);
                AssignCommand(oClient, ActionEquipItem(oIronRing, INVENTORY_SLOT_RIGHTRING));
                DelayCommand(0.1, SetCommandable(FALSE, oClient));
            }
            else
            {
                //Gold Ring (no special use)
                object oGoldRing = CreateItemOnObject("ww1_goldring", oClient);
                SetCommandable(TRUE, oClient);
                AssignCommand(oClient, ActionEquipItem(oGoldRing, INVENTORY_SLOT_RIGHTRING));
                DelayCommand(0.1, SetCommandable(FALSE, oClient));
            }

            //Give Rangers their Tracking Tool
            int iRanger = GetLevelByClass(CLASS_TYPE_RANGER, oClient);
            if (iRanger != 0)
            {
                CreateItemOnObject("trackertool", oClient);
            }
        }

        //Ensure that the player is commandable at the end of this.
        int bCommandable = GetCommandable(oClient);
        while (bCommandable == FALSE)
        {
            SetCommandable(TRUE, oClient);
            bCommandable = GetCommandable(oClient);
        }

    }
}
