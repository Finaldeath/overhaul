//* Take Fen Berry, Spawn Revenant Henchman
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFENBERRY");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CHREVENANT",GetLocation(GetWaypointByTag("WP_M2Q1SPAWNREVENANT")));
}
