// "small folk" PC, 25% true

int StartingConditional()
{
    int nRace = GetRacialType(GetPCSpeaker());
    if (((nRace == RACIAL_TYPE_GNOME) ||
        (nRace == RACIAL_TYPE_HALFLING) ||
        (nRace == RACIAL_TYPE_DWARF)) &&
        (d100() < 26))
    {
        return TRUE;
    }
    return FALSE;
}
