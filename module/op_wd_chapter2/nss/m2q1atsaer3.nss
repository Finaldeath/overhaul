//* Take Quartz Crystal, Spawn Hostile Demon
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITQUARTZCRYS");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"NW_DEMON",GetLocation(GetWaypointByTag("WP_M2Q1SPAWNHOSDEMON")));
}
