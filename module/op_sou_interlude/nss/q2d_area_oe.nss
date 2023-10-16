// On-enter event for the tomb of Kel-Garas

void DoSaveGame()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SAVE_GAME_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SAVE_GAME_ONCE", 1);
    DoSinglePlayerAutoSave();

}

void main()
{
    DoSaveGame();
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return; // can be also a DM

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE", 1);

    object oStatue1 = GetObjectByTag("Q2D_STATUE1");
    object oStatue2 = GetObjectByTag("Q2D_STATUE2");
    object oStatue3 = GetObjectByTag("Q2D_STATUE3");
    object oStatue4 = GetObjectByTag("Q2D_STATUE4");
    object oGarg1 = GetObjectByTag("Q2D_GARG1_Q2D_TRAP1");
    object oGarg2 = GetObjectByTag("Q2D_GARG2_Q2D_TRAP1");

    SetLocalInt(oStatue1, "X1_L_IMMUNE_TO_DISPEL", 10);
    SetLocalInt(oStatue2, "X1_L_IMMUNE_TO_DISPEL", 10);
    SetLocalInt(oStatue3, "X1_L_IMMUNE_TO_DISPEL", 10);
    SetLocalInt(oStatue4, "X1_L_IMMUNE_TO_DISPEL", 10);
    SetLocalInt(oGarg1, "X1_L_IMMUNE_TO_DISPEL", 10);
    SetLocalInt(oGarg2, "X1_L_IMMUNE_TO_DISPEL", 10);

    effect eStone = EffectPetrify();

    AssignCommand(oStatue1, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT));
    AssignCommand(oStatue3, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0));
    AssignCommand(oStatue4, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));

    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue1));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue2));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue3));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue4));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oGarg1));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oGarg2));

    //DelayCommand(2.0, SetPlotFlag(oStatue1, TRUE));
    //DelayCommand(2.0, SetPlotFlag(oStatue2, TRUE));
    //DelayCommand(2.0, SetPlotFlag(oStatue3, TRUE));
    //DelayCommand(2.0, SetPlotFlag(oStatue4, TRUE));


}
