void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M2Q3DA_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M2Q3DA_AUTOSAVE",1);
    }
}
