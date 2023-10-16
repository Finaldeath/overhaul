int StartingConditional()
{
    int iDispell = GetLocalInt(OBJECT_SELF, "KNOW_DISPELL");
    int iResult = FALSE;

    if (iDispell == TRUE)
    {
        iResult = TRUE;
    }
    return iResult;
}
