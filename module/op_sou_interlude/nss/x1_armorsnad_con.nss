// empty to avoid default behaviour

void RemoveEffects(object oObject)
{
    effect eEffect = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oObject, eEffect);
        eEffect = GetNextEffect(oObject);
    }
}

void main()
{
    PlaySound("as_cv_winch1");
    /*SetPlotFlag(OBJECT_SELF, FALSE);
    RemoveEffects(OBJECT_SELF);
    ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 0.5);
    effect eHold = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHold, OBJECT_SELF));
    ActionDoCommand(SetPlotFlag(OBJECT_SELF, TRUE));*/
}
