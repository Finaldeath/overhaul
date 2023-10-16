int StartingConditional()
{
    object o = GetLocalObject(OBJECT_SELF, "BT_OITEM_CHECKER");
    string sName = GetName(o);

    SetCustomToken(10001, sName);

    return TRUE;
}
