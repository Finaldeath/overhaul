// take a Slaadi tongue from the player

void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MSMLMISC19");
    DestroyObject(oItem);
    CreateItemOnObject("NW_IT_MSMLMISC19");
    int nCount = GetLocalInt(OBJECT_SELF, "FAIRY_COUNT");
    nCount++;
    SetCustomToken(30005, IntToString(nCount));
    SetLocalInt(OBJECT_SELF, "FAIRY_COUNT", nCount);

}
