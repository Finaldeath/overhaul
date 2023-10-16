void main()
{
    object oPC = GetPCSpeaker();

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPC);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectEthereal(), oPC);
}
