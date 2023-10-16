// Katriana is at her maximum reward

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1_Katriana_Reward") > 5;
    return iResult;
}
