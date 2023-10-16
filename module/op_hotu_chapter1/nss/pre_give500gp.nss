// Durnan gives 500 gp to the player
// mark the PC so Durnan doesn't give it twice

void main()
{
    SetLocalInt(GetPCSpeaker(), "Durnan_Front_Gold", TRUE);
    GiveGoldToCreature(GetPCSpeaker(), 500);
}
