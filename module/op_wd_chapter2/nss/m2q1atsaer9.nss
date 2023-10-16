//* Take Fen Berry, Spawn Potion
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFENBERRY");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
