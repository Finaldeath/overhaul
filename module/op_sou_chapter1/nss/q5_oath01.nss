// Tymofarrar has not yet sworn an oath

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Swore_Oath") == 0;
    return iResult;
}
