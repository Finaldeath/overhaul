// to prevent multiple persuade attempts

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1d_Hostage_Persuade") == 0;
    return iResult;
}
