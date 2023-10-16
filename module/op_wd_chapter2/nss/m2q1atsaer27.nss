//* Take Fen Berry, Cast Regeneration on people in the Area
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFENBERRY");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));

    AssignCommand(GetLastSpeaker(),ActionCastSpellAtObject(SPELL_CURE_CRITICAL_WOUNDS,OBJECT_SELF));
}
