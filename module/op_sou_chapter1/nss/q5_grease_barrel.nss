// cast a grease spell on itself and destroy self

void main()
{
     ActionCastSpellAtObject(SPELL_GREASE, OBJECT_SELF, METAMAGIC_ANY, TRUE);
    effect eDam = EffectDamage(1000);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF));
}
