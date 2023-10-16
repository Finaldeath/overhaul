//* Take Ettercap Silk
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITETTERSILK");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
