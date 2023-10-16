void main()
{
    object oPC = GetFirstPC();

    if (GetArea(oPC) == OBJECT_SELF)
    {
        // 65 % chance that the ship will "rock" due to water travel
        if (Random(100) < 65)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oPC, 2.0);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oPC);
        }
    }
}
