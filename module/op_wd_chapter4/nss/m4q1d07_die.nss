//* When a lizard warrior dies
// * in D07 he will check if a cleric is around
// * if so he gets the cleric to raise him back to life
void Raise()
{
    effect eVisDead = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    object oNew = CreateObject(OBJECT_TYPE_CREATURE,"M4Q1D07WARRIOR", GetLocation(OBJECT_SELF))  ;
   ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVisDead, GetLocation(oNew));

}
void main()
{
    object oCleric = GetNearestObjectByTag("M4Q1D07_CLERIC");

    if (GetIsObjectValid(oCleric) == TRUE && GetIsDead(oCleric) == FALSE)
    {
        AssignCommand(oCleric, ClearAllActions());
        AssignCommand(oCleric, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 3.0));
       effect eVisCleric = EffectVisualEffect(VFX_IMP_MAGBLUE);
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVisCleric, oCleric);
       DelayCommand(3.0, Raise());
       DelayCommand(0.2,AssignCommand(oCleric, SpeakOneLinerConversation())) ;

    }
}
