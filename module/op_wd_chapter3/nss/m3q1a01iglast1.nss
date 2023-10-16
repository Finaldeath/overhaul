int StartingConditional()
{
    int iResult;
    if (GetLocalInt(OBJECT_SELF,"M3Q1ProsecutionWon") == 0)
    {
        return TRUE;
    }

    return FALSE;
}
