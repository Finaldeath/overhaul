///checks if PC speaker is elf


int StartingConditional()
{
    int iResult;

    iResult = (GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_ELF);
    return iResult;
}
