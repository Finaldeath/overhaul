#include "help_inventory"

void main()
{
    SetLocalInt(OBJECT_SELF, "BT_H_INV_SLOT", INVENTORY_SLOT_ARMS);

    object o = GetFirstItemInInventory();

    int i = 1;

    while (o != OBJECT_INVALID)
    {
        if (IsBracer(o))
        {
            SetLocalObject(OBJECT_SELF, "BT_EQ_ITEM_" + IntToString(i), o);
            i++;
        }

        o = GetNextItemInInventory();
    }
}
