void main()
{
    SetLocalInt(GetPCSpeaker(),"NW_ASSA_DOUBLE_CROSS",1);
    SetLocalInt(OBJECT_SELF,"NW_ASSA_DOUBLE_CROSS",1);
    SetCustomToken(1003,GetName(GetPCSpeaker()));
}
