void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if (oPC != OBJECT_INVALID)
    {
        effect eVFX = EffectVisualEffect(VFX_IMP_DOOM);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF);
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
        DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
        DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
        DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
    }
}
