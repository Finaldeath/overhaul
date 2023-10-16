// the PC has been told about or has spoken to Musharak

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Musharak_Status") > 0;
    return iResult;
}
