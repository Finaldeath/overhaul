//* Take Quartz Crystal, Cast Stoneskin
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITQUARTZCRYS");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
    
    AssignCommand(GetLastSpeaker(),ActionCastSpellAtObject(SPELL_STONESKIN,OBJECT_SELF));
}
