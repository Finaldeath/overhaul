// the PC has spoken to Tymofarrar

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") > 0;
    return iResult;
}
