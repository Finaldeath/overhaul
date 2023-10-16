void main()
{
    SetLocalObject(OBJECT_SELF,"NW_Thurin_RingGiven",GetPCSpeaker());
    SetCustomToken(1005,GetName(GetPCSpeaker()));
    SetLocalInt(GetModule(),"NW_Thurin_Plot",1);
}
