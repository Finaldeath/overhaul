// var used in katriana's dialog

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
        return;
    SetLocalInt(oPC, "Q1_BEEN_IN_CAVES", 1);
}
