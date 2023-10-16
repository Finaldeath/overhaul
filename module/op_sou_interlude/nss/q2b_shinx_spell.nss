// detect a stone to flesh spell

void Create()
{
    CreateObject(OBJECT_TYPE_CREATURE, "sphinx001", GetLocation(OBJECT_SELF));
}

void main()
{
    int nSpell = GetLastSpell();
    if(nSpell == SPELL_STONE_TO_FLESH)
    {
        SetLocalLocation(GetArea(OBJECT_SELF), "SPHINX", GetLocation(OBJECT_SELF));
        DestroyObject(OBJECT_SELF);
        //Create();
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102));
    }
}
