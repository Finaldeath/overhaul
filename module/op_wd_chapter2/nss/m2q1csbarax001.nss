int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_TALKEDTOBARAX") == 0;
    return iResult;
}
