//* Take Ettercap Skin, Spawn Hostile Mephits
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITETTERSKIN");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"NW_MEPFIRE",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE1")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_MEPFIRE",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE2")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_MEPSTEAM",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE4")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_MEPMAGMA",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE3")));
}
