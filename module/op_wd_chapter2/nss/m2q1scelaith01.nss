// check if the speaker is an elf

int StartingConditional()
{
    int iResult;

    iResult = GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_ELF;
    return iResult;
}
