// if the PC has been told about the Drogan Herb quest
// but has not returned with the herbs yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "Drogan_Herbs") == 1;
    return iResult;
}
