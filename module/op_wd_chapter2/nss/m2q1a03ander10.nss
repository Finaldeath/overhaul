void main()
{
    SetLocalInt(OBJECT_SELF, "ANDER_KNOW_ALHELOR", 1);
    SetLocalObject(OBJECT_SELF, "PCHunter", GetPCSpeaker());
    SetCustomToken(2103, GetName(GetPCSpeaker()));
}
