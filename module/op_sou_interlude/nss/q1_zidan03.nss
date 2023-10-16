// Zidan gives his gold and his heirloom to the PC

void main()
{
    SetLocalInt(GetModule(), "q1_Zidan_Reward", 2);
    CreateItemOnObject("nw_it_mring009", GetPCSpeaker());
    GiveGoldToCreature(GetPCSpeaker(), 250);
}
