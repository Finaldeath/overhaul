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
    object oStone = GetObjectByTag("Q2E_STATUE_BANE");
    AssignCommand(oStone, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStone));
    DelayCommand(1.5, SetImmortal(oStone, TRUE));
}
