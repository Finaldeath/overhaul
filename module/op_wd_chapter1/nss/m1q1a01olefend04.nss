void main()
{
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M1S2Letter1"),GetPCSpeaker());
    CreateItemOnObject("M1S2LETTER2",GetPCSpeaker());
}

