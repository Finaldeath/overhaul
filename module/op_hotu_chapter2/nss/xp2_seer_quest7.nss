// if the fourth question has not already been asked

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "SEER_QUESTION4") == 0;
    return iResult;
}
