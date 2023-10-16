// J'nah is not dead

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X1_JNAH_STATUS") != 3;
    return iResult;
}
