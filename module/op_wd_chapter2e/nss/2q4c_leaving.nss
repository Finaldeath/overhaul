int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "I_AM_LEAVING") == 1;
    return iResult;
}
