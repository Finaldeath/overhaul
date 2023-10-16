// the PC talked specifically to Sharwyn

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "pre_Talked_Sharwyn") == 1;
    return iResult;
}
