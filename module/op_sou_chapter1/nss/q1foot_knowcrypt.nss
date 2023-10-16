// if the PC knows about the elven crypt

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1foot_Know_Crypt") == 1;
    return iResult;
}
