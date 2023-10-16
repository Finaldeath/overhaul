// take a Belladona root from the urn

void main()
{
    object oItem = GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC23");
    ActionGiveItem(oItem, GetPCSpeaker());
    int nCount = GetLocalInt(OBJECT_SELF, "BELLADONA_COUNT");
    nCount--;
    if(GetTag(OBJECT_SELF) == "Q3B_LEFT_URN")
        SetCustomToken(30002, IntToString(nCount));
    else
        SetCustomToken(33002, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "BELLADONA_COUNT", nCount);
}
