// Tymofarrar is not dead

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") != 3;
    return iResult;
}
