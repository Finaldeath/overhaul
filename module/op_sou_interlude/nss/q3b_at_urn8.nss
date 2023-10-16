// take Dragon's Blood root from the urn

void main()
{
    object oItem = GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC17");
    ActionGiveItem(oItem, GetPCSpeaker());
    int nCount = GetLocalInt(OBJECT_SELF, "DRAGON_COUNT");
    nCount--;
    if(GetTag(OBJECT_SELF) == "Q3B_LEFT_URN")
        SetCustomToken(30003, IntToString(nCount));
    else
        SetCustomToken(33003, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "DRAGON_COUNT", nCount);
}
