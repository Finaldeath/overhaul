int StartingConditional()
{
    DeleteLocalInt(OBJECT_SELF, "BT_H_INV_SLOT");

    DeleteLocalInt(OBJECT_SELF, "BT_H_INV_MANAGER");

    SetLocalInt(OBJECT_SELF, "BT_H_INV_EQ_CURSOR", 1);

    SetLocalInt(OBJECT_SELF, "BT_H_INV_DONE", FALSE);

    SetLocalInt(OBJECT_SELF, "BT_H_INV_CURR_CHOICE", 1);

    SetLocalObject(OBJECT_SELF, "BT_H_INV_MOD_OBJECT", OBJECT_SELF);

    int i = 1;

    object o = GetFirstItemInInventory();

    while (o != OBJECT_INVALID)
    {
        DeleteLocalObject(OBJECT_SELF, "BT_EQ_ITEM_" + IntToString(i));

        i++;

        o = GetNextItemInInventory();
    }

    // to mark end of list
    DeleteLocalObject(OBJECT_SELF, "BT_EQ_ITEM_" + IntToString(i));

    return TRUE;
}
