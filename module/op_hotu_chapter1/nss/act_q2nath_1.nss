//act_q2nath_1
void main()
{
    object oPC = GetPCSpeaker();
    if (GetIsObjectValid(GetMaster()) == FALSE)
    {
        AddHenchman(GetPCSpeaker(), OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", TRUE);
    }
}
