// returns true if player is an elf
int StartingConditional()
{
    return GetRacialType(GetPCSpeaker()) != RACIAL_TYPE_ELF;
}
