//* Take Skeleton Knuckle, Spawn Massive Amount of Goblins
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITSKELKNUCKL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"NW_GOBLINA",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE1")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_GOBLINA",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE2")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_GOBLINA",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE3")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_GOBLINA",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE4")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_GOBLINA",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE5")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_GOBLINA",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE6")));
}
