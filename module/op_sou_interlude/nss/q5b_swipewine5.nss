// the player steals the bottle

void main()
{
    SetLocalInt(OBJECT_SELF, "q5b_Bottle_Gone", 1);
    CreateItemOnObject("q5b_bottle", GetPCSpeaker());
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 3);

    int nAlign = GetAlignmentGoodEvil(GetPCSpeaker());
    if (nAlign == ALIGNMENT_GOOD)
    {
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_EVIL, 1);
    }
}
