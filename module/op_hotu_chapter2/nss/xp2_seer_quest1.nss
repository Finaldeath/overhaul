// if the first question has not already been asked

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "SEER_QUESTION1") == 0;
    return iResult;
}
