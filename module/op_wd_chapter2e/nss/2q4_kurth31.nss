int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Baram_Gold_Reward") == 3;
    return iResult;
}
