int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Kurth_Gold_Reward") == 0;
    return iResult;
}
