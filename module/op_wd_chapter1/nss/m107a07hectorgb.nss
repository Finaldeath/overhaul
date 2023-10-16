void main()
{
    SetLocalInt(GetModule(),"NW_G_PlotAldo",16);
    //ChangeFaction(OBJECT_SELF,GetPCSpeaker());
    SetLocalObject(OBJECT_SELF,"NW_L_FollowTarget",GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_M1Q5A07HectorWithPC",TRUE);
}
