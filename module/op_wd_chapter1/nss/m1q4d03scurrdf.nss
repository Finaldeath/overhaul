void main()
{
    object oPC = GetPCSpeaker();
    ClearAllActions();
    AssignCommand(GetPCSpeaker(),ClearAllActions());
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectSleep(),OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectKnockdown(),oPC,10.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectAbilityDecrease(ABILITY_INTELLIGENCE,6),oPC,HoursToSeconds(1));
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_SLEEP),oPC);
    SetLocalInt(GetModule(),"NW_G_M1Q4DSkurrd",TRUE);
}
