// petrify trigger

void main()
{
    if(!GetIsPC(GetEnteringObject()))
        return;
    //int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE");
    //if(nDoOnce == 1)
    //    return;
    //SetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE", 1);
    effect eStone = EffectPetrify();

    object oMinotaur1 = GetObjectByTag("Q2D_MINOTAUR1");
    object oMinotaur2 = GetObjectByTag("Q2D_MINOTAUR2");
    object oMinotaur3 = GetObjectByTag("Q2D_MINOTAUR3");
    object oMinotaur4 = GetObjectByTag("Q2D_MINOTAUR4");

    SetPlotFlag(oMinotaur1, FALSE);
    SetPlotFlag(oMinotaur2, FALSE);
    SetPlotFlag(oMinotaur3, FALSE);
    SetPlotFlag(oMinotaur4, FALSE);

    SetLocalInt(oMinotaur1, "X1_L_IMMUNE_TO_DISPEL", 10);
    SetLocalInt(oMinotaur2, "X1_L_IMMUNE_TO_DISPEL", 10);
    SetLocalInt(oMinotaur3, "X1_L_IMMUNE_TO_DISPEL", 10);
    SetLocalInt(oMinotaur4, "X1_L_IMMUNE_TO_DISPEL", 10);

    AssignCommand(oMinotaur1, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
    AssignCommand(oMinotaur2, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
    AssignCommand(oMinotaur3, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
    AssignCommand(oMinotaur4, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));

    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oMinotaur1));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oMinotaur2));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oMinotaur3));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oMinotaur4));

    DelayCommand(2.0, SetPlotFlag(oMinotaur1, TRUE));
    DelayCommand(2.0, SetPlotFlag(oMinotaur2, TRUE));
    DelayCommand(2.0, SetPlotFlag(oMinotaur3, TRUE));
    DelayCommand(2.0, SetPlotFlag(oMinotaur4, TRUE));
}
