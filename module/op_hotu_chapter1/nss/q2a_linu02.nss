// the PC talked specifically to Linu

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "pre_Talked_Linu") == 1;
    return iResult;
}


