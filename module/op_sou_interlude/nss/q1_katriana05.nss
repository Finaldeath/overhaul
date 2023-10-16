// Katriana is at 700 gp or higher reward

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1_Katriana_Reward") > 2;
    return iResult;
}
