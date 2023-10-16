//* Take Fire Beetle Belly, Cast Fire Resistance on all in area
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFIRBEETBEL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));

    AssignCommand(GetLastSpeaker(),ActionCastSpellAtObject(SPELL_RESIST_ELEMENTS,OBJECT_SELF));
}
