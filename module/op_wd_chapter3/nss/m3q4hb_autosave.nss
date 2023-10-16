void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M3Q4HB_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M3Q4HB_AUTOSAVE",1);
    }
}
