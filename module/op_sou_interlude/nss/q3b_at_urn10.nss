// take Fairy Dust from the urn

void main()
{
    object oItem = GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC19");
    ActionGiveItem(oItem, GetPCSpeaker());
    int nCount = GetLocalInt(OBJECT_SELF, "FAIRY_COUNT");
    nCount--;
    if(GetTag(OBJECT_SELF) == "Q3B_LEFT_URN")
        SetCustomToken(30005, IntToString(nCount));
    else
        SetCustomToken(33005, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "FAIRY_COUNT", nCount);
}
