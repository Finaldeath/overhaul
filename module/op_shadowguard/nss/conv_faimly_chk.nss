//Check that Jathos has spoken his first faimly dialog.
int StartingConditional()
{
    int iResult = FALSE;
    int iFaimly = GetLocalInt(OBJECT_SELF, "JANTHOS_PARENTS");

    if (iFaimly == 1)
    {
        iResult = TRUE;
    }

    return iResult;
}
