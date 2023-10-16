// take a ruby from the player

void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_GEM006");
    int nStack = GetItemStackSize(oItem);
    nStack--;
    if(nStack == 0)
        DestroyObject(oItem);
    else
        SetItemStackSize(oItem, nStack);
    CreateItemOnObject("NW_IT_GEM006");
    int nCount = GetLocalInt(OBJECT_SELF, "RUBY_COUNT");
    nCount++;
    if(GetTag(OBJECT_SELF) == "Q3B_LEFT_URN")
        SetCustomToken(30001, IntToString(nCount));
    else
        SetCustomToken(33001, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "RUBY_COUNT", nCount);
}
