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

void Stone(object oStatue, int bImmortal = FALSE, int bPlot = FALSE)
{
    SetPlotFlag(oStatue, FALSE);
    SetImmortal(oStatue, FALSE);
    effect eStone = EffectPetrify();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue);
    if(bImmortal)
        SetImmortal(oStatue, TRUE);
    if(bPlot)
        SetPlotFlag(oStatue, TRUE);
}

void main()
{
    DoSaveGame();
    object oEnter = GetEnteringObject();
    if(!GetIsPC(oEnter))
        return;
    //object oStatue = GetObjectByTag("Q2E_STATUE_BANE");
    object oGarg1 = GetObjectByTag("Q2E_GARG1_Q2E_TRAP1");
    object oGarg2 = GetObjectByTag("Q2E_GARG2_Q2E_TRAP1");
    object oGarg3 = GetObjectByTag("Q2E_GARG1_Q2E_TRAP2");
    object oGarg4 = GetObjectByTag("Q2E_GARG2_Q2E_TRAP2");
    object oFocus = GetObjectByTag("Q2E_WP_STATUE_JUMP"); // used to find nearest statues

    //Stone(oStatue, TRUE);
    Stone(oGarg1);
    Stone(oGarg2);
    Stone(oGarg3);
    Stone(oGarg4);


    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ARCHERS_STONE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ARCHERS_STONE_ONCE", 1);


    int i = 0;
    object oArcher1;
    object oArcher2;
    object oArcher3;
    object oArcher4;
    for(i = 1; i <= 4; i++)
    {
        oArcher1 = GetNearestObjectByTag("Q2E_ARCHER_STATUE1", oFocus, i);
        oArcher2 = GetNearestObjectByTag("Q2E_ARCHER_STATUE2", oFocus, i);
        oArcher3 = GetNearestObjectByTag("Q2E_ARCHER_STATUE3", oFocus, i);
        oArcher4 = GetNearestObjectByTag("Q2E_ARCHER_STATUE4", oFocus, i);
        Stone(oArcher1);
        Stone(oArcher2);
        Stone(oArcher3);
        Stone(oArcher4);
    }
}
