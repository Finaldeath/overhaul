// the PC is either a half-orc, human or half-elf.

int StartingConditional()
{
    int nRace = GetRacialType(GetPCSpeaker());
    if ((nRace == RACIAL_TYPE_HALFORC) || (nRace == RACIAL_TYPE_HUMAN) || (nRace == RACIAL_TYPE_HALFELF))
    {
        return TRUE;
    }
    return FALSE;
}
