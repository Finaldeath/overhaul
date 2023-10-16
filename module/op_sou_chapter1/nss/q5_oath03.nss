// Tymofarrar swore an oath

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Swore_Oath") == 1;
    return iResult;
}
