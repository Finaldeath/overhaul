void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_GildaPissed",10);
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1Q04ISMUGCOIN"),GetPCSpeaker());
}
