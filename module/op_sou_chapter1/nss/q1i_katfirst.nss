// if this is the first time the PC has talked to Katriana

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1i_talked_Katriana") == 0;
    return iResult;
}
