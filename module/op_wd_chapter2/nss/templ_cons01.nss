void main()
{
    SetLocalInt(GetModule(),"NW_CONS_PLOT",1);
    SetLocalObject(OBJECT_SELF,"NW_CONS_PLOT_PC",GetPCSpeaker());
    SetCustomToken(1003,GetName(GetPCSpeaker()));
}
