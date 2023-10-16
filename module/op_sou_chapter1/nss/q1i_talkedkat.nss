// the pc has already spoken to Katriana

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1i_talked_Katriana") == 1;
    return iResult;
}
