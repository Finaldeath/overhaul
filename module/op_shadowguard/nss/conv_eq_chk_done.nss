int StartingConditional()
{
    int n = GetLocalInt(OBJECT_SELF, "BT_H_INV_MANAGER");

    int nCursor = GetLocalInt(OBJECT_SELF, "BT_H_INV_EQ_CURSOR");

    int i = (n * 15) + nCursor;

    object o = GetLocalObject(OBJECT_SELF, "BT_EQ_ITEM_" + IntToString(i));

    if (o == OBJECT_INVALID)
        return FALSE;

    return TRUE;
}
