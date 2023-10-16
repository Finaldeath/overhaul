// Tymofarrar has not yet promised a reward

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Promised_Reward") == 0;
    return iResult;
}
