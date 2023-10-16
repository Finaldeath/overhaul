// the PC has agreed to kill J'Nah for Tymofarrar

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 2;
    return iResult;
}
