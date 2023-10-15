void main()
{
    object oPerceived = GetLastPerceived();
    if(GetRacialType(oPerceived) == RACIAL_TYPE_UNDEAD &&
       GetLastPerceptionSeen() &&
       GetTag(oPerceived) != "M0Q0_SKELETON" &&
       IsInConversation(OBJECT_SELF) == FALSE)
    {
        ActionCastSpellAtObject(SPELLABILITY_TURN_UNDEAD,oPerceived,METAMAGIC_ANY,TRUE);

    }
}
