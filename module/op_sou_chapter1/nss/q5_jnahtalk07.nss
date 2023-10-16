// the PC has not met J'Nah

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X1_JNAH_STATUS") == 0;
    return iResult;
}
