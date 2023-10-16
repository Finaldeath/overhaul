//* South Golem shuts down if wizard killed
void main()
{
    if (GetLocalInt(GetModule(),"NW_G_B20SouthWizard") == 10)
    {
        //* increment number of golems killed
        SetLocalInt(GetModule(),"NW_G_M4Q01_GOLEMS", GetLocalInt(GetModule(),"NW_G_M4Q01_GOLEMS") + 1);
//        SpeakString(IntToString(GetLocalInt(GetModule(),"NW_G_M4Q01_GOLEMS")));
        SetIsDestroyable(FALSE,FALSE,FALSE);
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
        effect eDeath = EffectDeath();
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, OBJECT_SELF);
    }
}
