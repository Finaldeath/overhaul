// Zidan gives his gold to the PC

void main()
{
    SetLocalInt(GetModule(), "q1_Zidan_Reward", 1);
    GiveGoldToCreature(GetPCSpeaker(), 250);
}
