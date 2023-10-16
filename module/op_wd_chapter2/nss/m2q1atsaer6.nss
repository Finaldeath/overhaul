//* Take Skeleton Knuckle
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITSKELKNUCKL");
    
    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
