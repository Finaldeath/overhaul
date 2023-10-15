void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1Q0D_AUTOSAVE") == FALSE &&
       GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M1Q0D_AUTOSAVE",TRUE);
    }
}
