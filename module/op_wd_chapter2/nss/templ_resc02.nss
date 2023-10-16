void main()
{
    CreateItemOnObject("RESC_RING01",GetPCSpeaker());
    SetLocalObject(OBJECT_SELF,"NW_Resc_RingGiven",GetPCSpeaker());
    SetCustomToken(1001,GetName(GetPCSpeaker()));
}

