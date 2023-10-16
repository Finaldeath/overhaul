// Katriana is at 500 or 600 gp

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(OBJECT_SELF, "q1_Katriana_Reward") == 1) ||
               (GetLocalInt(OBJECT_SELF, "q1_Katirana_Reward") == 2));
    return iResult;
}
