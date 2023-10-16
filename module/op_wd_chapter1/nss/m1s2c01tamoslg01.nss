void main()
{
    SetLocalObject(OBJECT_SELF,"NW_L_M1S2BroachGiven",GetPCSpeaker());
    SetCustomToken(621,GetName(GetPCSpeaker()));
    CreateItemOnObject("M1S2BROACH",GetPCSpeaker());
}
