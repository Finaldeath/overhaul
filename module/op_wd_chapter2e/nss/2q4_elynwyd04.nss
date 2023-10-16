void main()
{
    CreateItemOnObject("Elynwyd_Ring",GetPCSpeaker());
    SetLocalObject(OBJECT_SELF,"Ring_Given_To",GetPCSpeaker());
    SetCustomToken(1071,GetName(GetPCSpeaker()));
}
