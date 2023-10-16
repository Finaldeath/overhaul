
// * Creator casts offensive spell, then destroys self
void main()
{

    ActionCastSpellAtObject(SPELL_HOLD_MONSTER,GetObjectByTag("M3Q3C_GUARDIAN"), METAMAGIC_ANY, TRUE);
    DelayCommand(10.0, ActionDoCommand(DestroyObject(OBJECT_SELF)));

}
