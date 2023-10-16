// spirit of Isande leaves (destroys itself) after got the sword back

void main()
{
    effect eLeave = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLeave, OBJECT_SELF));
    DelayCommand(2.0, DestroyObject(OBJECT_SELF));
}
