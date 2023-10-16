// if the player has the tower statue now

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q6_All_Done") == 1;
    return iResult;
}
