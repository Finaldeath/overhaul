int StartingConditional()
{
    int l_iResult;

    l_iResult = GetGender(GetPCSpeaker()) == GENDER_FEMALE;
    return l_iResult;
}
