int StartingConditional()
{
    int iResult;

    iResult = GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HALFORC;
    return iResult;
}
