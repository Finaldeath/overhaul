// Explores area for player

void main()
{
    if (GetIsPC(GetEnteringObject()))
        ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());

    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(GetModule(), "N_REPLENISH_VOY_SUPPLY"))
        {
            object oChest = GetNearestObjectByTag("PLAC_VOY_SUPPLY_CHEST", oPC);

            // Destroy all old items in the chest
            object o = GetFirstItemInInventory(oChest);

            while (o != OBJECT_INVALID)
            {
                DestroyObject(o);

                o = GetNextItemInInventory(oChest);
            }

            int i;

            // create five rations in the Supply Chest
            for (i = 1; i <= 5; i++)
                CreateItemOnObject("IT_MISC_MEAL_001", oChest);

            // Set the variable for replenishing supplies to FALSE for now
            SetLocalInt(GetModule(), "N_REPLENISH_VOY_SUPPLY", FALSE);
        }
    }
}
