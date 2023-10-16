//* Take Fen Berry, Spawn Hostile Will-o-wisps
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFENBERRY");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"NW_WILLOWISP",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE1")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_WILLOWISP",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE2")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_WILLOWISP",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE5")));
}
