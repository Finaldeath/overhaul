// if the second question has not already been asked

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "SEER_QUESTION2") == 0;
    return iResult;
}
