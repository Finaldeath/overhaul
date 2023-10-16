// Store spell info for spell conduits

void main()
{
    SetLocalInt(OBJECT_SELF, "CURRENT_SPELL", SPELL_CHAIN_LIGHTNING);
    object oScroll = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_SPARSCR607");
    SetLocalObject(OBJECT_SELF, "CURRENT_SPELL_SCROLL", oScroll);
    SetLocalObject(OBJECT_SELF, "PC", GetPCSpeaker());
    ExecuteScript("q4d_at_conduit1", OBJECT_SELF);
}
