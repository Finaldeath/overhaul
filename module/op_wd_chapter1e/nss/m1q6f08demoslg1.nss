void main()
{
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
    SetLocalObject(OBJECT_SELF,"NW_L_FirstSpeaker",GetPCSpeaker());
}
