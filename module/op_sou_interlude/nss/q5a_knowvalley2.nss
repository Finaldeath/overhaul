// if the PC has been told about the Valley of Winds

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Know_Valley") == 1;
    return iResult;
}
