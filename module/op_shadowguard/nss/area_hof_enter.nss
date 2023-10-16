void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oPC);

    }
}
