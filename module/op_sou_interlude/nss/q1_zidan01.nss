// if the player got something out of Zidan for his rescue

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q1_Zidan_Reward") > 0;
    return iResult;
}
