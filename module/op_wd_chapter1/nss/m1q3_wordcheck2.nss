int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"M1Q3SecretWord") == TRUE;
    return iResult;
}
