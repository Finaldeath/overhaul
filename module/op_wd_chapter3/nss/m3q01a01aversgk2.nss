int StartingConditional()
{
    int iResult;

    iResult = GetGender(OBJECT_SELF) != GetGender(GetPCSpeaker());
    return iResult;
}
