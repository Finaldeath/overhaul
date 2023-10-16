// Scout trigger 2 - drow scout runs away intp the holes area and falls down the hole

void Run(object oPC)
{
    object oScout = GetNearestObjectByTag("bk_DrowScout");
    object oWP = GetWaypointByTag("bk_wp_scout2");
    effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
    effect eDust = EffectVisualEffect(VFX_IMP_DUST_EXPLOSION);
    effect eKnock = EffectKnockdown();

    AssignCommand(oScout, ClearAllActions());
    AssignCommand(oScout, ActionMoveToObject(oWP, TRUE, 0.0));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oPC));
    AssignCommand(oScout, ActionPlayAnimation(ANIMATION_FIREFORGET_SPASM));
    AssignCommand(oScout, ActionDoCommand(SpeakOneLinerConversation("bk_scout")));
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oPC));
    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eKnock, oScout));
    DelayCommand(4.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, GetLocation(oWP)));
    DelayCommand(4.5, DestroyObject(oScout));

}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    Run(oPC);
}
