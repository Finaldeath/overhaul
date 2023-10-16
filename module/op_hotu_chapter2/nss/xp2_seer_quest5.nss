// if the third question has not already been asked

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "SEER_QUESTION3") == 0;
    return iResult;
}
