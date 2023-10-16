// bard pc plays for the magical creature

void main()
{
    effect eSong = EffectVisualEffect(VFX_DUR_BARD_SONG);
    ActionPauseConversation();
    //AssignCommand(GetPCSpeaker(), ClearAllActions());
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSong, GetPCSpeaker(), 3.0);
    DelayCommand(3.0, ActionResumeConversation());

}
