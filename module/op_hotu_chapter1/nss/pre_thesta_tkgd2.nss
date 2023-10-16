// Thesta takes the 500 gold from the PC
// the PC's alignment shifts slightly towards good

void main()
{
    TakeGoldFromCreature(500, GetPCSpeaker(), TRUE);
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_GOOD, 2);
}
