// take Dragon's Blood from the player

void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MSMLMISC17");
    DestroyObject(oItem);
    CreateItemOnObject("NW_IT_MSMLMISC17");
    int nCount = GetLocalInt(OBJECT_SELF, "DRAGON_COUNT");
    nCount++;
    SetCustomToken(30003, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "DRAGON_COUNT", nCount);
}
