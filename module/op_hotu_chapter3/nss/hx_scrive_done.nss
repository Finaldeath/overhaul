// When done.
int StartingConditional()
{
    int iResult;

    if(GetLocalInt(GetModule(), "bScrivenerQuestComplete") == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
