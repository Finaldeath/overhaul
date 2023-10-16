void main()
{
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING01"), GetPCSpeaker());
    SetLocalInt(GetModule(),"NW_G_URTHCURED",1);
}
