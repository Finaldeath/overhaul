// ethereal visage effect

void Talk(object oTalk)
{
    BeginConversation("q3c_cutscene", oTalk);
}

void main()
{
    effect eVis = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);

    object oJnah = GetNearestObjectByTag("Q3_JNAH");
    BeginConversation("", oJnah);
    //DelayCommand(2.0, Talk(oJnah));
    //DelayCommand(2.0, ActionStartConversation(oJnah));
}
