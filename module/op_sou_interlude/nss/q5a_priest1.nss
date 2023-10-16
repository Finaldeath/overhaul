// if the priest has not introduced himself

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5a_Introduced1") == 0;
    return iResult;
}
