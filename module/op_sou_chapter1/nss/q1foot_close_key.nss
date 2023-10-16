void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF, "q1rumgutkey");
    if (oKey != OBJECT_INVALID)
        DestroyObject(oKey);
}
