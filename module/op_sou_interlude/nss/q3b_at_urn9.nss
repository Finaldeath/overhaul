// take a Slaadi tongue from the urn

void main()
{
    object oItem = GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC10");
    ActionGiveItem(oItem, GetPCSpeaker());
    int nCount = GetLocalInt(OBJECT_SELF, "SLAADI_COUNT");
    nCount--;
    if(GetTag(OBJECT_SELF) == "Q3B_LEFT_URN")
        SetCustomToken(30004, IntToString(nCount));
    else
        SetCustomToken(33004, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "SLAADI_COUNT", nCount);
}
