void main()
{
    int nFound = 0;
    effect eEffect = GetFirstEffect(OBJECT_SELF);

    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING03"), GetPCSpeaker());
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q1SILVERCHARM"), GetPCSpeaker());

    while (GetIsEffectValid(eEffect) && nFound == 0)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_POLYMORPH),OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints() - GetCurrentHitPoints()),OBJECT_SELF);
            DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_RESTORATION_LESSER),OBJECT_SELF));
            RemoveEffect(OBJECT_SELF,eEffect);
            nFound = 1;
        }
        else
        {
            eEffect = GetNextEffect(OBJECT_SELF);
        }
    }
    ActionWait(1.0);
    ActionResumeConversation();
}
