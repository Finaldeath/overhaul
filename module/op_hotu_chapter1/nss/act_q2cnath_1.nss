void main()
{
    SetLocalInt(OBJECT_SELF, "nWaitForPCToReturn", 0);
    AddHenchman(GetPCSpeaker(), OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", TRUE);
}
