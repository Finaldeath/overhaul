//* Take Quartz Crystal
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITQUARTZCRYS");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
