// if it is the pc who starts conversation
int StartingConditional()
{
    int iResult;

    iResult = GetIsPC(GetPCSpeaker());
    return iResult;
}
