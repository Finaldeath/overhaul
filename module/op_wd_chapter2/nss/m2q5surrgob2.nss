int StartingConditional()
{
    int iResult = GetLocalInt(OBJECT_SELF,"HasSurrendered");
    if (iResult == 10)
    {
        return TRUE;
    }
    return FALSE;
}
