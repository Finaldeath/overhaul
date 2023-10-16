void main()
{
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
    SetLocalInt(GetModule(),"NW_G_M1Q5KrestalSpokenToXXX", 10);
}
