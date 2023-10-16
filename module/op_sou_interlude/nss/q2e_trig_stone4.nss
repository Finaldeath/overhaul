// petrify trigger

void Petrify(string sTag)
{
    effect eStone = EffectPetrify();
    object oStatue1 = GetNearestObjectByTag(sTag, OBJECT_SELF, 1);
    object oStatue2 = GetNearestObjectByTag(sTag, OBJECT_SELF, 2);
    string sNum = GetStringRight(sTag, 1);
    object oTarget = GetNearestObjectByTag("Q2E_TARGET" + sNum);
    //AssignCommand(oStatue1, ActionAttack(oTarget));
    //AssignCommand(oStatue2, ActionAttack(oTarget));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue1));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue2));
    //DelayCommand(3.0, SetPlotFlag(oStatue1, TRUE));
    //DelayCommand(3.0, SetPlotFlag(oStatue2, TRUE));

}

void main()
{
    if(!GetIsPC(GetEnteringObject()))
        return;
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_ENTER_RIGHT_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_ENTER_RIGHT_ONCE", 1);

    Petrify("Q2E_ARCHER_STATUE1");
    Petrify("Q2E_ARCHER_STATUE2");
    Petrify("Q2E_ARCHER_STATUE3");
    Petrify("Q2E_ARCHER_STATUE4");
}
