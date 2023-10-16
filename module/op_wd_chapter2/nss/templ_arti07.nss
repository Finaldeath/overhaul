void main()
{
    SetLocalInt(GetModule(),"NW_ARTI_PLOT",1);
    SetLocalObject(OBJECT_SELF,"NW_ARTI_PLOT_PC",GetPCSpeaker());
    SetCustomToken(1002,GetName(GetPCSpeaker()));
}
