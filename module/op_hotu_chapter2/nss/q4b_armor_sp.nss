// Armor stand: freeze animation

void main()
{
    effect eHold = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
    effect eHold2 = EffectCutsceneParalyze();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHold, OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHold2, OBJECT_SELF);
}
