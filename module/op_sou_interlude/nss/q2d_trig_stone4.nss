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
    object oGarg7 = GetObjectByTag("Q2D_GARG1_Q2D_TRAP4");
    object oGarg8 = GetObjectByTag("Q2D_GARG2_Q2D_TRAP4");
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oGarg7));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oGarg8));
}
