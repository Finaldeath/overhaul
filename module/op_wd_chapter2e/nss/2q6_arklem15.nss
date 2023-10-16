// if Arklem has already asked the PC to free him

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "ARKLEM_PLOT") == 1;
    return iResult;
}
