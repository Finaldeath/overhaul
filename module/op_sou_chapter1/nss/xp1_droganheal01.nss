// if the PC has not been told about the Drogan Herb quest

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "Drogan_Herbs") == 0;
    return iResult;
}
