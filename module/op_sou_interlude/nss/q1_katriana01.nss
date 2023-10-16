// Katriana has not currently offered a reward to the PC

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1_Katriana_Reward") == 0;
    return iResult;
}
