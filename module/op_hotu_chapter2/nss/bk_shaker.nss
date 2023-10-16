// * 30% chance of shaking the screen when stepped across
void main()
{
    object oEnter = GetEnteringObject();
    if (GetIsPC(oEnter) && Random(100) > 30)
    {
        effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oEnter, 2.4);
    }
}
