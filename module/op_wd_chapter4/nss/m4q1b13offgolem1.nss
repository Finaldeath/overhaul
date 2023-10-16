//* North Golem shuts down if wizard killed
void main()
{
    if (GetLocalInt(GetModule(),"NW_G_B13NorthWizard") == 10)
    {
        SetIsDestroyable(FALSE,FALSE,FALSE);
        SetLocalInt(GetModule(),"NW_G_M4Q01_GOLEMS", GetLocalInt(GetModule(),"NW_G_M4Q01_GOLEMS") + 1);
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
        effect eDeath = EffectDeath();
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, OBJECT_SELF);
    }
}
