int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "Shaltalk") == 1;
    return iResult;
}
