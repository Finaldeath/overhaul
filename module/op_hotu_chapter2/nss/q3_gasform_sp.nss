
void main()
{
    effect eVis = EffectVisualEffect(VFX_DUR_GHOST_SMOKE);
    effect eBump = EffectCutsceneGhost();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBump, OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);

}
