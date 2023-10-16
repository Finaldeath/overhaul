int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_TALKPAST") ==1;
    return iResult;
}
