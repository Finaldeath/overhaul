// once the brazier have been destroyed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "ARKLEM_PLOT") == 3;
    return iResult;
}
