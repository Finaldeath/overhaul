// the PC talked specifically to Daelan

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "pre_Talked_Daelan") == 1;
    return iResult;
}

