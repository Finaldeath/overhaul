//Check that Jathos has spoken his first faimly dialog.
int StartingConditional()
{
    int iResult = FALSE;
    int iFaimly = GetLocalInt(OBJECT_SELF, "JANTHOS_PARENTS");

    if (iFaimly == FALSE)
    {
        iResult = TRUE;
    }

    return iResult;
}
