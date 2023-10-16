// Petrify dragon statue

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oStatue = GetNearestObjectByTag("q3c_statue");
    effect eStone = EffectPetrify();
    AssignCommand(oStatue, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 2.0, 3.0));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue));
    //DelayCommand(1.5, SetPlotFlag(oStatue, TRUE));

}
