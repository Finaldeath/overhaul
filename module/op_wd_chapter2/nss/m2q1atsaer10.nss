//* Take Quartz Crystal, Spawn in Gargoyle Henchmen
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITQUARTZCRYS");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CHGARGOYLE",GetLocation(GetWaypointByTag("WP_M2Q1SPAWNGARGOYLE")));
}
