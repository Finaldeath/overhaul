// Only if PC already has the Rune stone.

void main()
{
    return GetItemPossessedBy(GetPCSpeaker(), "x0_powerstone") != OBJECT_INVALID;
}
