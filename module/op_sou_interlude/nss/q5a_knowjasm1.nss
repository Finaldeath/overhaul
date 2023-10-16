// the PC has been told about or has spoken to Jasmeena

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status") > 0;
    return iResult;
}
