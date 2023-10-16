int StartingConditional()
{
    int nRace = GetRacialType(GetPCSpeaker());
    int bCondition = !(nRace == RACIAL_TYPE_HUMAN ||
                       nRace == RACIAL_TYPE_ELF ||
                       nRace == RACIAL_TYPE_HALFELF);
    return bCondition;
}
