// petrify trigger

void main()
{
    if(!GetIsPC(GetEnteringObject()))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE", 1);

    effect eStone = EffectPetrify();
    object oGarg3 = GetObjectByTag("Q2D_GARG1_Q2D_TRAP2");
    object oGarg4 = GetObjectByTag("Q2D_GARG2_Q2D_TRAP2");
    DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oGarg3));
    DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oGarg4));
}
