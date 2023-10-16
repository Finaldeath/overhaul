int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_G_M3Q04TALKKLAUTH") == 0;
    return iResult;
}
