// Valana gives the PC her possessions

void main()
{
    GiveGoldToCreature(GetPCSpeaker(), 480);
    CreateItemOnObject("it_mring009", GetPCSpeaker());
}
