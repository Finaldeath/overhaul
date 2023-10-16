int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Kurth_Gold_Reward") == 1;
    return iResult;
}
