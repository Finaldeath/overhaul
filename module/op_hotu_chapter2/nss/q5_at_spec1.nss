// Add spec as a follower

void main()
{
    AddHenchman(GetPCSpeaker(), OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", TRUE);
}
