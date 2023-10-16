void main()
{
    ActionPauseConversation();
    ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE),GetPCSpeaker());
    ActionResumeConversation();
}
