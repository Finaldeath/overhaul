void main()
{
    SetPlotFlag(OBJECT_SELF, FALSE);
    effect eStone = EffectPetrify();
    PlayAnimation(ANIMATION_LOOPING_CONJURE1, 5.0, 3.0);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, OBJECT_SELF));
    DelayCommand(1.0, SetPlotFlag(OBJECT_SELF, TRUE));
}
