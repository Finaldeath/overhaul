int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Baram_Gold_Reward") == 0;
    return iResult;
}
