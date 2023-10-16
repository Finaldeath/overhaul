//* Take Fire Beetle Belly, Cast Cloudkill at a random spawn point
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFIRBEETBEL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    AssignCommand(GetLastSpeaker(),ActionCastSpellAtLocation(SPELL_CLOUDKILL,GetLocation(GetWaypointByTag("WP_RANDOMCAST1"))));
}
