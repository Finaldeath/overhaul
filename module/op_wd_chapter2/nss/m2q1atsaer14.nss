//* Take Skeleton Knuckle, Spawn Female Trumpet Archon Henchman
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITSKELKNUCKL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CHARCHON",GetLocation(GetWaypointByTag("WP_M2Q1SPAWNARCHON")));
}
