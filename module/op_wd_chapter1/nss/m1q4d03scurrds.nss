void main()
{
    ClearAllActions();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectSleep(),OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectTemporaryHitpoints(50),GetPCSpeaker(),HoursToSeconds(6));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectAbilityDecrease(ABILITY_INTELLIGENCE,-4),GetPCSpeaker(),HoursToSeconds(1));
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE),GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"NW_L_M1Q4DrankSkurrd",TRUE);
    SetLocalInt(GetModule(),"NW_G_M1Q4DSkurrd",TRUE);
}
