// Flag Zesyyr as started dialog so it can be re-initiated when the player enters the
// house Maevir area after loading a save game

void main()
{
    SetLocalInt(OBJECT_SELF, "X2_IN_HOUSE", 1);
}
