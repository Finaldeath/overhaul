void main()
{
    object o = GetEnteringObject();

    if (GetStringLeft(GetTag(o), 5) == "HENCH")
    {
        SetLocalObject(GetModule(), "O_MASTER_" + GetTag(o), o);

        // Have each Henchman start with 5 Potions of Cure Light Wounds
        CreateItemOnObject("IT_MISC_POTI_012", o, 5);

        // Set up the beginning items in Henchman's inventory to be "non-takeable" by PC
        object oItem = GetFirstItemInInventory(o);

        while (oItem != OBJECT_INVALID)
        {
            SetPlotFlag(oItem, TRUE);

            oItem = GetNextItemInInventory(o);
        }

        int i;

        for (i = 0; i <= NUM_INVENTORY_SLOTS; i++)
        {
            oItem = GetItemInSlot(i, o);

            SetPlotFlag(oItem, TRUE);
        }
    }
}
