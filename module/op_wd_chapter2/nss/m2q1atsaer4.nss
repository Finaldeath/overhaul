//* Take Fire Beetle Belly, Create Magic Staff
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFIRBEETBEL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
