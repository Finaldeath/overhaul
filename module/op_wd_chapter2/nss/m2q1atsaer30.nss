//* Take Ettercap Silk, Cast Web at Random Spawn point
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITETTERSILK");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    AssignCommand(GetLastSpeaker(),ActionCastSpellAtLocation(SPELL_WEB,GetLocation(GetWaypointByTag("WP_RANDOMCAST1"))));
}
