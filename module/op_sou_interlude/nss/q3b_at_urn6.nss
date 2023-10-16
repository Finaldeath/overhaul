// take a ruby from the urn

void main()
{
    object oItem = GetItemPossessedBy(OBJECT_SELF, "NW_IT_GEM006");
    int nStack = GetItemStackSize(oItem);
    nStack--;
    if(nStack == 0)
        DestroyObject(oItem);
    else
        SetItemStackSize(oItem, nStack);
    //ActionGiveItem(oItem, GetPCSpeaker());

    CreateItemOnObject("NW_IT_GEM006", GetPCSpeaker());

    int nCount = GetLocalInt(OBJECT_SELF, "RUBY_COUNT");
    nCount--;
    if(GetTag(OBJECT_SELF) == "Q3B_LEFT_URN")
        SetCustomToken(30001, IntToString(nCount));
    else
        SetCustomToken(33001, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "RUBY_COUNT", nCount);
}
