void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF, "IT_PLOT_009");

    if (oKey != OBJECT_INVALID)
    {
        CreateItemOnObject("IT_PLOT_009", GetPCSpeaker());

        DestroyObject(oKey);
    }
}
