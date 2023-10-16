int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_TalkToGorkan") == 10;
    return iResult;
}
