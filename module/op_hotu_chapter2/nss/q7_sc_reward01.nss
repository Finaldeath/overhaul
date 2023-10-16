// the Valsharess has not yet mentioned a reward

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q7_Valsharess_Reward") == 0;
    return iResult;
}
