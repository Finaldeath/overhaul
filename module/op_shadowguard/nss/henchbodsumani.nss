void main()
{
    ActionCastFakeSpellAtObject(SPELL_SUMMON_CREATURE_I, OBJECT_SELF, PROJECTILE_PATH_TYPE_DEFAULT);
    DelayCommand(3.0, SummonAnimalCompanion());
}
