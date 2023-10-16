/// Check if PC has not heard Fenthick's intro speech

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M1Q01TALKFENTHICK") == 0;
    return iResult;
}
