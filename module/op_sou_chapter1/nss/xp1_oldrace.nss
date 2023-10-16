// if the PC is an elf, half-elf, dwarf or gnome

int StartingConditional()
{
    int nRace = GetRacialType(GetPCSpeaker());
    if ((nRace == RACIAL_TYPE_ELF) ||
       (nRace == RACIAL_TYPE_GNOME) ||
       (nRace == RACIAL_TYPE_DWARF) ||
       (nRace == RACIAL_TYPE_HALFELF))
    {
        return TRUE;
    }
    return FALSE;
}
