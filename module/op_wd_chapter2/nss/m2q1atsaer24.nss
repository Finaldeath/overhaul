//* Take Ettercap Silk, Spawn Succubus Henchman, will only join Evil
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITETTERSILK");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CHSUCCUBUS",GetLocation(GetWaypointByTag("WP_M2Q1SPAWNSUCCUBUS")));
}
