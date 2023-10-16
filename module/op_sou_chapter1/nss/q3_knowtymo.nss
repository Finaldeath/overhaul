// if the PC has heard of Tymofarrar

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "Know_Tymo") == 1;
    return iResult;
}
