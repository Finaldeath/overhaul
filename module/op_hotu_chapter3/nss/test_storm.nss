void main()
{
    effect eVis = EffectVisualEffect(VFX_FNF_STORM);
    location lTarget = GetLocation(OBJECT_SELF);

    ActionCastFakeSpellAtLocation(SPELL_STORM_OF_VENGEANCE, lTarget);
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STORM), lTarget);
}
