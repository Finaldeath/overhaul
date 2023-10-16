//* Take Ettercap Silk, Spawn Flesh Golem Henchman
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITETTERSILK");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CHGOLEMFLESH",GetLocation(GetWaypointByTag("WP_M2Q1SPAWNFLESHGOLEM")));
}
