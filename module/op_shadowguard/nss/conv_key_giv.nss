void main()
{
    object oPC = GetPCSpeaker();

    object oKey = OBJECT_INVALID;

    object o = GetFirstItemInInventory();

    while (o != OBJECT_INVALID)
    {
        if (GetBaseItemType(o) == BASE_ITEM_KEY)
            oKey = o;

        o = GetNextItemInInventory();
    }

    AssignCommand(OBJECT_SELF, ActionGiveItem(oKey, oPC));
}
