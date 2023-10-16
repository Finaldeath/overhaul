void main()
{
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
    SetLocalInt(GetPCSpeaker(),"NW_L_M1Q5SpokeToHarben",TRUE);
    SetLocalObject(OBJECT_SELF,"NW_L_FirstSpoken",GetPCSpeaker());
    SetCustomToken(520,GetName(GetPCSpeaker()));
}
