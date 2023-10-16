// Temple of Lolth on-exit: autosave

void main()
{
    object oPC = GetExitingObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_EXIT_AUTOSAVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_EXIT_AUTOSAVE_ONCE", 1);

    DoSinglePlayerAutoSave();

}
