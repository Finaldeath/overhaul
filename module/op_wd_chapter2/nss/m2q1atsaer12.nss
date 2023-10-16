//* Take Fire Beetle Belly, Cast Damage Resistance on all in area
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITETTERSILK");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
