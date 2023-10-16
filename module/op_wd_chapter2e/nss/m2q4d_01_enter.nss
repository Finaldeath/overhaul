void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M2Q4D_01_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M2Q4D_01_AUTOSAVE",1);
    }
}
