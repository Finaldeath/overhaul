//* Take Skeleton Knuckle, Spawn Hostile Ghosts/Undead
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITSKELKNUCKL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"NW_GHAST",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE1")));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_GHAST",GetLocation(GetWaypointByTag("WP_M2Q1HOSTILE2")));
}
