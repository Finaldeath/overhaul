// Katriana gives the final reward to the PC

void main()
{
    SetLocalInt(OBJECT_SELF, "q5_Katriana_Reward", 1);
    CreateItemOnObject("it_mring033", GetPCSpeaker());
}
