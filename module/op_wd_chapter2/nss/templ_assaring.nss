void main()
{
    object oRing = GetItemPossessedBy(OBJECT_SELF,"ASSA_ITEM01");
    ActionGiveItem(oRing,GetPCSpeaker());
}
