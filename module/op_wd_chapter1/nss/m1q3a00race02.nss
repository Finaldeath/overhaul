int StartingConditional()
{
    int bCondition = GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_ELF ||
                      GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HALFELF;
    return bCondition;
}
