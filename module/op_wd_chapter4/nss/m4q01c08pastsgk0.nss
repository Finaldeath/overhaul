int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_TALKPAST") ==0;
    return iResult;
}

