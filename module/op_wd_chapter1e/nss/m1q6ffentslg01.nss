void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES",1);
    SetLocalInt(GetPCSpeaker(),"NW_L_Init_" + GetTag(OBJECT_SELF),TRUE);
}
