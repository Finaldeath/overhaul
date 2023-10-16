// "big folk" PC, 25% true

int StartingConditional()
{
    int nRace = GetRacialType(GetPCSpeaker());
    if (((nRace == RACIAL_TYPE_ELF) ||
        (nRace == RACIAL_TYPE_HALFELF) ||
        (nRace == RACIAL_TYPE_HALFORC) ||
        (nRace == RACIAL_TYPE_HUMAN)) &&
        (d100() < 26))
    {
        return TRUE;
    }
    return FALSE;
}
