// When the PC has agreed to destroy the braziers

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "ARKLEM_PLOT") == 2;
    return iResult;
}
