int StartingConditional()
{
    return GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_ELF ||
           GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_DWARF;
}

