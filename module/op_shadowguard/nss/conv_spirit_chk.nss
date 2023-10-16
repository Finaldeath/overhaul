// Check if Alia has explained the spirit cycle.
int StartingConditional()
{
    int iResult = FALSE;
    int iCHK = GetLocalInt(OBJECT_SELF, "ACADEMY_SPIRIT_DLG");

    if (iCHK != TRUE)
    {
        iResult = TRUE;
    }

    return iResult;
}
