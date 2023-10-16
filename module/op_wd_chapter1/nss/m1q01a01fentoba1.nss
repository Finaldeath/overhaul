////Take Note 1 from player

void main()
{
    // **************
    // * Patch 2 Mod
    // Destroying the item so it cannot be pick pocketed for unlimited gold
    // * Brent.
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(), "M1Q1_LetterConspiracy"));
    // **************

//    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(), "M1Q1_LetterConspiracy"), GetPCSpeaker());
}
