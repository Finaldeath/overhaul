void main()
{
    string sItemTag = "IT_PLOT_024";

    object oKey = GetItemPossessedBy(OBJECT_SELF, sItemTag);

    if (oKey != OBJECT_INVALID)
    {
        CreateItemOnObject(sItemTag, GetPCSpeaker());

        DestroyObject(oKey);
    }
}
