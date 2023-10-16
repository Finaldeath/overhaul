// take a Slaadi tongue from the player

void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MSMLMISC10");
    DestroyObject(oItem);
    CreateItemOnObject("NW_IT_MSMLMISC10");
    int nCount = GetLocalInt(OBJECT_SELF, "SLAADI_COUNT");
    nCount++;
    if(GetTag(OBJECT_SELF) == "Q3B_LEFT_URN")
        SetCustomToken(30004, IntToString(nCount));
    else
        SetCustomToken(33004, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "SLAADI_COUNT", nCount);
}
