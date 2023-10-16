/// Check if PC has heard Fenthick's intro speech but not been told to see Aribeth

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M1Q01TALKFENTHICK") == 1;
    return iResult;
}

