// the PC never talked specifically to Sharwyn

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "pre_Talked_Sharwyn") == 0;
    return iResult;
}
