// take a Belladona root from the player

void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MSMLMISC23");
    DestroyObject(oItem);
    CreateItemOnObject("NW_IT_MSMLMISC23");
    int nCount = GetLocalInt(OBJECT_SELF, "BELLADONA_COUNT");
    nCount++;
    if(GetTag(OBJECT_SELF) == "Q3B_LEFT_URN")
        SetCustomToken(30002, IntToString(nCount));
    else
        SetCustomToken(33002, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "BELLADONA_COUNT", nCount);
}
