void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M2Q5Q_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M2Q5Q_AUTOSAVE",1);
    }
}
