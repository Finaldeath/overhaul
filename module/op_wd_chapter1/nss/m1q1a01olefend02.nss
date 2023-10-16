void main()
{
    SetLocalInt(GetModule(),"NW_G_M1S2MaskShutDown",TRUE);
    CreateItemOnObject("M1S2LETTER3",GetPCSpeaker());
}
