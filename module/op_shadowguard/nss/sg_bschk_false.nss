int StartingConditional()
{
    int iDispell = GetLocalInt(OBJECT_SELF, "KNOW_DISPELL");
    int iResult = TRUE;

    if (iDispell == TRUE)
    {
        iResult = FALSE;
    }
    return iResult;
}
