// Tymofarrar has already given gold and magic

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Gave_Gold") == 1;
    return iResult;
}
