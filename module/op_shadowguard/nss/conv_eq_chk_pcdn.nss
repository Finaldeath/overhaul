int StartingConditional()
{
    int n = GetLocalInt(GetPCSpeaker(), "BT_H_INV_MANAGER");

    int nCursor = GetLocalInt(GetPCSpeaker(), "BT_H_INV_EQ_CURSOR");

    int i = (n * 15) + nCursor;

    object o = GetLocalObject(GetPCSpeaker(), "BT_EQ_ITEM_" + IntToString(i));

    if (o == OBJECT_INVALID)
        return FALSE;

    return TRUE;
}
