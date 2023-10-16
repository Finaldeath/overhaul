void main()
{
    if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
    {
        if (GetLocalInt(GetModule(), "N_INTERLUDE") == 1)
        {
            SetFacing(90.0);

            AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 10.0));

            AssignCommand(OBJECT_SELF, DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), OBJECT_SELF)));
        }
    }
}
