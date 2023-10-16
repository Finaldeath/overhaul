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
    object oGarg5 = GetObjectByTag("Q2E_GARG1_Q2E_TRAP1");
    object oGarg6 = GetObjectByTag("Q2E_GARG2_Q2E_TRAP1");
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oGarg5));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oGarg6));
}
