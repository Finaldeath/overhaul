// Store spell info for spell conduits

void main()
{
    SetLocalInt(OBJECT_SELF, "CURRENT_SPELL", SPELL_BIGBYS_CRUSHING_HAND);
    object oScroll = GetItemPossessedBy(GetPCSpeaker(), "X1_IT_SPARSCR901");
    SetLocalObject(OBJECT_SELF, "CURRENT_SPELL_SCROLL", oScroll);
    SetLocalObject(OBJECT_SELF, "PC", GetPCSpeaker());
    ExecuteScript("q4d_at_conduit1", OBJECT_SELF);
}
