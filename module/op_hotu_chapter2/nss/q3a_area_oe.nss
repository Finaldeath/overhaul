// Drearing's deep on-enter: save game

void DoSave()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SAVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SAVE_ONCE", 1);

    DoSinglePlayerAutoSave();

}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    DoSave();
}
