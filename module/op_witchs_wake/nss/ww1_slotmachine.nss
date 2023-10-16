//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer's Slot Machine
//:: WW1_SlotMachine.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     It takes any gold added by the player and
     either destroys or duplicates it based on
     random chance.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 21, 2002
//:://////////////////////////////////////////////

void SpawnWinnings(int iWinnings)
{
    object oSlotMachine = GetObjectByTag("ww1_SlotMachine");
    CreateItemOnObject("nw_it_gold001", oSlotMachine, iWinnings);
}

void main()
{
    object oSlotMachine = GetObjectByTag("ww1_SlotMachine");
    object oPC = GetLastUsedBy();

    //To prevent exploits, only allow the slot machine to be used five times.
    int iTimesUsed = GetLocalInt(OBJECT_SELF, "iTimesUsed");
    if (iTimesUsed <= 5)
    {
        //Increment the usage count.
        iTimesUsed = iTimesUsed+1;
        SetLocalInt(OBJECT_SELF, "iTimesUsed", iTimesUsed);

        //Play the lever animation
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        DelayCommand(0.5, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

        //Play lever sounds
        PlaySound("as_sw_lever1");

        //Parse the inventory for gold.
        object oItem = GetFirstItemInInventory(oSlotMachine);
        int iBaseType;
        int iGold;
        while (oItem != OBJECT_INVALID)
        {
            iBaseType = GetBaseItemType(oItem);
            if (iBaseType == BASE_ITEM_GOLD)
            {
                //Get amount of gold.
                iGold = GetNumStackedItems(oItem);

                //Destroy current existing gold.
                DestroyObject(oItem);

                //Determine winnings (from 0-200% of the original investment)
                int iMaxWinnings = (iGold * 2);
                int iWinnings = Random(iMaxWinnings+1);

                //Inform the player of the winnings
                string sWinnings = IntToString(iWinnings);
                string sMessage = "Your gold has been transmuted. There is now "+sWinnings+
                                  " guilder in the infernal contraption.";
                SendMessageToPC(oPC, sMessage);

                //Spawn in winnings
                DelayCommand(0.5, SpawnWinnings(iWinnings));

                //Play the transmutation sounds.
                AssignCommand(oSlotMachine, DelayCommand(0.5, PlaySound("as_mg_telepin1")));
                AssignCommand(oSlotMachine, DelayCommand(1.0, PlaySound("it_coins")));
                AssignCommand(oSlotMachine, DelayCommand(1.2, PlaySound("it_coins")));
                AssignCommand(oSlotMachine, DelayCommand(1.4, PlaySound("it_coins")));
            }

            oItem = GetNextItemInInventory(oSlotMachine);
        }
    }
    //Provide an error message if they've used it too many times.
    else
    {
        string sErrorMessage = "The lever is stuck and refuses to budge. A "+
                               "gear must have slipped in the mechanism below.";
        SendMessageToPC(oPC, sErrorMessage);
    }
}
