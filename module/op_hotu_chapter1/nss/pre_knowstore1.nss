// if the PC has been told about Durnan's supplies

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "Know_Durnan_Store") == TRUE;
    return iResult;
}
