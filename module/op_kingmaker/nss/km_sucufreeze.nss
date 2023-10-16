void main()
{
    object oTarget = GetObjectByTag("q3_dyingwoman");
    effect eFreeze = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) == TRUE)
    {
        DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_PERMANENT,
            eFreeze, oTarget));
    }
}
