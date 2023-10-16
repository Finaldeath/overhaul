//* Take Fire Beetle Belly, Spawn Wand
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFIRBEETBEL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
